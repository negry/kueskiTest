//
//  MoviesRepository.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 10/03/25.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getPopularMovies(withCurrentPage page: Int) async throws -> MovieResponse
}

final class MoviesRepository: MoviesRepositoryProtocol {
    private let apiClient: KueskiAPIClientProtocol
    
    init(apiClient: KueskiAPIClientProtocol = KueskiAPIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getPopularMovies(withCurrentPage page: Int) async throws -> MovieResponse {
        let endpoint = KueskiMoviesEndpoint.discoverMovies(page: page)
        return try await apiClient.fetchRequest(for: endpoint)
    }
}
