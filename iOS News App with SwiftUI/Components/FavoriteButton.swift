//
//  FavoriteButton.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI

struct FavoriteButton: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "star.fill")
                .padding(.top, 5)
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    FavoriteButton()
}
