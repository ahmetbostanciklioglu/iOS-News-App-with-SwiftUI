//
//  NewsDetailView.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI
import Kingfisher

struct NewsDetailView: View {
    var news: NewsViewModel
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(news.title )
                    .font(.title3.weight(.medium))
                    .padding()
                
                KFImage(URL(string: news.urlToImage ))
                    .resizable()
                    .frame(height: 340)
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                
                
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .top) {
                        Text(news.author)
                            .font(.callout.weight(.medium))
                        
                        Spacer()
                        Button(action: toggleFavorite) {
                            HStack {
                                Image(systemName: isFavorite ? "star.fill" : "star")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.blue)
                        }
                    }
                    
                    Text(news.description)
                        .font(.body.weight(.medium))
                        .foregroundColor(.secondary)
                        .lineLimit(10)
                }
                .padding()
                
                
                
            }
        }
    }
    
    private func toggleFavorite() {
        isFavorite.toggle()
    }
}


#Preview {
    NewsDetailView(news: NewsViewModel(article: Article()))
}
