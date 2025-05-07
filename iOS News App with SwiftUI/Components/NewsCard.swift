//
//  NewsCard.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI
import Kingfisher


struct NewsCard: View {
    var news: NewsViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack(spacing: 3) {
                if let url = URL(string: news.urlToImage) {
                    KFImage(url)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFill()
                        .imageScale(.large)
                        .clipShape(.rect(cornerRadius: 10))
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(news.title)
                        .font(.callout.weight(.bold))
                        .kerning(0.85)
                        .lineLimit(2)
                        
                    Text(news.description)
                        .font(.caption.weight(.medium))
                        .kerning(0.75)
                        .lineLimit(3)
                    Spacer()
                }
                .padding([.leading, .top], 10)
                .background(Color.white)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
        }
    }
}

#Preview {
    NewsCard(news: NewsViewModel(article: Article()))
}
