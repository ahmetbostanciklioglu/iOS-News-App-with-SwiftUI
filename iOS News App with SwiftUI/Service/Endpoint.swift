//
//  Endpoint.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation


enum Endpoint {
    case topHeadlines
    
    var path: String {
        switch self {
        case .topHeadlines:
            return "top-headlines"
        }
    }
    
    var countryCode: String {
        switch self {
        case .topHeadlines:
            "us"
        }
    }

    var fullPath: String {
        return "\(Constants.baseURL)\(path)?country=\(countryCode)&apiKey=\(Constants.apiKey)"
    }
}
