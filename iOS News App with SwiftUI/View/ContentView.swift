//
//  ContentView.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var newsListViewModel = NewsListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(newsListViewModel.newsList) { newsViewModel in
                    ZStack {
                        NewsCard(news: newsViewModel)
                        NavigationLink(destination: NewsDetailView(news: newsViewModel),
                                       label: { EmptyView()}).opacity(0)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Top Headlines")
        }
        .onAppear {
            newsListViewModel.load()
        }
    }
}

#Preview {
    ContentView()
}
