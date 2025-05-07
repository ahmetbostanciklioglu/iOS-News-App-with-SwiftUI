//
//  FavoritesView.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI

struct FavoritesView: View {
    @State private var favorites: [Article] = []
    
    var body: some View {
        Text("No favorites yet!")
    }
}

#Preview {
    FavoritesView()
}
