//
//  FavoriteRow.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI

struct FavoriteRow: View {
    var news: Article
    
    var body: some View {
        HStack(spacing: 20) {
            Image("haber")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Fenerbahçe GS'yi Mağlup Etti! 1-0 !!!")
                    .bold()
                    .lineLimit(2)
            }
            
            Spacer()
            
            
            Image(systemName: "trash")
                .foregroundStyle(Color(hue: 1, saturation: 0.89, brightness: 0.83))
                .onTapGesture { }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FavoriteRow(news: Article())
}
