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
                .navigationTitle("Popular Movies")
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
            ProgressView("Loading...").progressViewStyle(CircularProgressViewStyle()).padding()
        case .loadingFailed(let errorMessage):
            Text("Error: \(errorMessage)").foregroundColor(.red).padding()
        case .dataLoaded:
            renderMovieListView()
        }
    }
    
    @ViewBuilder
    private func renderMovieListView() -> some View {
        List(viewModel.movies, id: \.id) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieRow(movie: movie)
            }
        }
    }
}

struct MovieRow: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            Text(movie.title)
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                Text(movie.overview)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieListView()
}
