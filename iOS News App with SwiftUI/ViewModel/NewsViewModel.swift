//
//  NewsViewModel.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation

class NewsViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var author: String {
        article.author ?? "Unknown Author"
    }
   
    var title: String {
        article.title ?? "No Title"
    }
    
    var description: String {
        article.description ?? "No Description"
    }
    
    var url: String {
        article.url ?? ""
    }
    
    var urlToImage: String {
        article.urlToImage ?? "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
}
