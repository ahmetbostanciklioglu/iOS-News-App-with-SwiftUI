//
//  NewsService.swift
//  iOS News App with SwiftUI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import Foundation


class NewsService {
    static let shared = NewsService()

    
    func fetchTopHeadlines<T: Decodable>(endpoint: Endpoint,  completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: endpoint.fullPath) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error  {
                completion(.failure(NetworkError.networError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                if let data = data, let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    completion(.failure(NetworkError.apiError(statusCode: httpResponse.statusCode, message: errorResponse.message ?? "Unknown error")))
                } else {
                    completion(.failure(NetworkError.invalidStatusCode(httpResponse.statusCode)))
                }
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
                
            } catch let error as DecodingError {
                let decodingError = NetworkError.decodingFailed(error)
                print("Decoding error: \(decodingError.localizedDescription)")
                completion(.failure(decodingError))
                
            } catch {
                completion(.failure(NetworkError.unknownError(error)))
            }
        }.resume()
    }
    
    func getImages(urlString: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                return completion(nil)
            }
            completion(data)
        }.resume()
    }
}


struct ErrorResponse: Codable {
    var status: String
    var code: String?
    var message: String?
}

enum NetworkError: Error, LocalizedError{
    case invalidURL
    case networError(Error)
    case invalidResponse
    case apiError(statusCode: Int, message: String)
    case invalidStatusCode(Int)
    case invalidData
    case unknownError(Error)
    case decodingFailed(DecodingError)
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL format"
        case .networError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Received invalid response from server"
        case .apiError(let statusCode, let message):
            return "API Error (\(statusCode)): \(message)"
        case .invalidStatusCode(let code):
            return "Server returned status code: \(code)"
        case .invalidData:
            return "Received invalid data from server"
        case .unknownError(let error):
            return "Unknown error occured: \(error.localizedDescription)"
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
    
    var localizedDescription: String {
        return errorDescription ?? "Unknown network error"
    }
}


