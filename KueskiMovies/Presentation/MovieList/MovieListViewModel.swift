//
//  MovieListViewModel.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 08/03/25.
//

import SwiftUI

enum MovieListState {
    case loading
    case dataLoaded
    case loadingFailed(String)
}

@Observable
final class MovieListViewModel {
    var movies: [Movie] = []
    var viewState: MovieListState = .loading
    
    private let moviesRepository: MoviesRepositoryProtocol
    private var moviesResponse: MovieResponse?
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.moviesRepository = moviesRepository
    }
    
    func fetchMovies(page: Int, forceReload: Bool = false) async {
        viewState = .loading
        do {
            let fetchedMovies = try await moviesRepository.getPopularMovies(withCurrentPage: page)
            moviesResponse = fetchedMovies
            movies = fetchedMovies.results
            viewState = .dataLoaded
        } catch {
            viewState = .loadingFailed(error.localizedDescription)
            debugPrint(error)
        }
    }
}
