//
//  MovieListViewModel.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 08/03/25.
//

import SwiftUI

@Observable
final class MovieListViewModel {
    var movies: [MovieResponse] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let moviesRepository: MoviesRepositoryProtocol
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.moviesRepository = moviesRepository
    }
    
    func fetchMovies(page: Int) async {
        isLoading = true
        defer {
            isLoading = false
        }
        
        do {
            let fetchedMovies = try await moviesRepository.getPopularMovies(withCurrentPage: page)
            self.movies = fetchedMovies
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
