import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    private var genreNames: [String] {
        let genres = ["Action", "Drama", "Comedy", "Thriller", "Horror"]
        return movie.genreIDs.map { genres[$0 % genres.count] }
    }
    
    private var posterUrl: URL? {
        let fullUrlString = "\(KueskiAPIClient.detailedImageUrl)\(movie.posterPath ?? "")"
        return URL(string: fullUrlString)
    }
    
    var body: some View {
        ScrollView {
            renderHeaderView()
            
            Text(movie.overview)
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
                            Color.black.opacity(0.6)
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
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

#Preview {
    MovieDetailView(movie: .mock)
}
