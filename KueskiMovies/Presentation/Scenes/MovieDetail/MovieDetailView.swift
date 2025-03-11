import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    let genres: [Genre]
    
    private var genreNames: [String] {
        return movie.genreNames(from: genres)
    }
    
    private var posterUrl: URL? {
        let fullUrlString = "\(KueskiAPIClient.detailedImageUrl)\(movie.posterPath ?? "")"
        return URL(string: fullUrlString)
    }
    
    var body: some View {
        ScrollView {
            renderHeaderView()
            
            Text(movie.overview)
                .font(.callout)
                .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func renderHeaderView() -> some View {
        ZStack(alignment: .leading) {
            if let url = posterUrl {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(1.8, contentMode: .fill)
                        .overlay(
                            Color.black.opacity(0.7)
                        )
                } placeholder: {
                    ProgressView()
                        .frame(alignment: .center)
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)
                
                Text("\(movie.releaseDate)")
                Text("Genres: \(genreNames.joined(separator: ", "))")
                    .font(.callout)
                    .bold()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

#Preview {
    MovieDetailView(movie: .mock, genres:
                        [
                            Genre(id: 28, name: "Action"),
                                           
                            Genre(id: 53, name: "Adventure"),
                                           
                            Genre(id: 80, name: "Comedy")
                        ])
}
