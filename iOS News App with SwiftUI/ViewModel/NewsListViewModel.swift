//
//  NewsListViewModel.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation


final class NewsListViewModel: ObservableObject {
    @Published var newsList = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    @Published var errorMessage: String = ""
    let service = NewsService()
    
    func load() {
        getNews()
    }
    
    // MARK: - Get News from NewsService
    func getNews() {
        service.fetchTopHeadlines(endpoint: .topHeadlines) { (response: Result<News, Error>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let news):
                    self.getImages(for: news.articles)
                    DispatchQueue.main.async {
                        self.newsList = news.articles.map(NewsViewModel.init)
                    }
                    
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // MARK: - Get images from NewsService
    private func getImages(for news: [Article]) {
        news.forEach { item in
            guard let urlToImage = item.urlToImage, !urlToImage.isEmpty else { return }
            
            service.getImages(urlString: urlToImage) { data in
                guard let data else { return }
                
                DispatchQueue.main.async {
                    self.imageData[urlToImage] = data
                }
            }
        }
    }
}
