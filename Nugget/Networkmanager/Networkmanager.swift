//
//  Networkmanager.swift
//  Nugget
//
//  Created by Palatip Jantawong on 17/4/2567 BE.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case authenticationError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.adviceslip.com/advice"
    
    private let quotesURL = "https://api.api-ninjas.com/v1/quotes?category=inspirational"
    
    private init() {}
    
    func fetchAdvice() async throws -> Slip {
        
        guard let url = URL(string: baseURL) else {
            throw APError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            return try decoder.decode(slipResponse.self, from: data).slip
        } catch {
            throw APError.invalidData
        }
    }
}
