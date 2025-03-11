//
//  MovieListView.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 08/03/25.
//

import SwiftUI

struct MovieListView: View {
    private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            renderContentView()
                .navigationTitle(LocalizedKey.MovieList.title.localized)
                .navigationBarTitleDisplayMode(.large)
        }
        .task {
            await viewModel.fetchMovies(page: 1)
        }
    }
    
    @ViewBuilder
    private func renderContentView() -> some View {
        switch viewModel.viewState {
        case .loading:
            renderLoadingProgress()
        case .loadingFailed:
            renderErrorView()
        case .dataLoaded:
            renderMovieListView()
        }
    }
    
    @ViewBuilder
    private func renderErrorView() -> some View {
        Text(LocalizedKey.MovieList.error)
            .foregroundColor(.red)
            .padding()
    }
    
    @ViewBuilder
    private func renderLoadingProgress() -> some View {
        ProgressView(LocalizedKey.MovieList.loading.localized).progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
    
    @ViewBuilder
    private func renderMovieListView() -> some View {
        List(viewModel.movies, id: \.id) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieListRowView(movie: movie)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    MovieListView()
}
