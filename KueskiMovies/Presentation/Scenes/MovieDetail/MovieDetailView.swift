//
//  MovieDetailView.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import SwiftUI

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
    MovieDetailView(movie: .mock)
}
