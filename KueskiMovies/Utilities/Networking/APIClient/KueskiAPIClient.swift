//
//  ApiClient.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 10/03/25.
//

import Foundation

final class KueskiAPIClient: KueskiAPIClientProtocol {
    
    static let shared = KueskiAPIClient()
        
    private init() {}
    
    func fetchRequest<T: Decodable>(for endpoint: KueskiEndpointProtocol) async throws -> T {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = endpoint.queryItems
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
