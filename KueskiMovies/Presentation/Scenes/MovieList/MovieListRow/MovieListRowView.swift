//
//  MovieListRowView.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import SwiftUI

struct MovieListRowView: View {
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

#Preview {
    MovieListRowView(movie: .mock)
}
