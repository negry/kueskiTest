//
//  GenresRepository.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

protocol GenresRepositoryProtocol {
    func getGenres(behavior: CacheBehavior) async throws -> [Genre]
}

final class GenresRepository: GenresRepositoryProtocol {
    private let apiClient: KueskiAPIClientProtocol
    
    init(apiClient: KueskiAPIClientProtocol = KueskiAPIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getGenres(behavior: CacheBehavior) async throws -> [Genre] {
        return try await CacheManager.shared.get(forKey: "movieGenres", behavior: behavior) {
            let response: GenreResponse = try await self.apiClient.fetchRequest(for: GenresEndpoint.allMoviesGenres)
            return response.genres
        }
    }
}

