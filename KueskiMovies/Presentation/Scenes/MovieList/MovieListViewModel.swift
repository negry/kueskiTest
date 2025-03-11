//
//  MovieListViewModel.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 08/03/25.
//

import SwiftUI

enum MovieListState: Equatable {
    case loading
    case dataLoaded
    case loadingFailed(String)
}

@Observable
final class MovieListViewModel {
    
    private(set) var movies: [Movie] = []
    private(set) var genres: [Genre] = []
    private(set) var viewState: MovieListState = .loading
    
    private let moviesRepository: MoviesRepositoryProtocol
    private let genresRepository: GenresRepositoryProtocol
    private var moviesResponse: MovieResponse?
    
    // MARK: - Pagination
    private(set) var currentPage = 1
    private(set) var isLoadingMore = false
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository(),
         genresRepository:GenresRepositoryProtocol = GenresRepository()) {
        self.moviesRepository = moviesRepository
        self.genresRepository = genresRepository
    }
    
    func fetchMovies(page: Int, forceReload: Bool = false) async {
        if isLoadingMore { return }
        isLoadingMore = true
        
        if forceReload {
            currentPage = 1
            movies = []
        }
        
        do {
            let fetchedMovies = try await moviesRepository.getPopularMovies(withCurrentPage: currentPage)
            moviesResponse = fetchedMovies
            movies.append(contentsOf: fetchedMovies.results)
            viewState = .dataLoaded
            currentPage += 1
        } catch {
            viewState = .loadingFailed(error.localizedDescription)
            debugPrint(error)
        }
        
        isLoadingMore = false
    }
    
    func loadMoreMoviesIfNeeded(currentMovie: Movie) async {
        guard let lastMovie = movies.last, lastMovie.id == currentMovie.id else { return }
        await fetchMovies(page: currentPage)
    }
    
    func loadGenres() async {
        do {
            genres = try await genresRepository.getGenres(behavior: .firstAvailable)
        } catch {
            debugPrint("Error loading genres: \(error.localizedDescription)")
        }
    }
}
