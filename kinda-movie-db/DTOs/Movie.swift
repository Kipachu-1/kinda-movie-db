//
//  movie.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/10/24.
//

struct MovieDTO: Codable {
    let id: Int
    let title: String
    let poster_path: String?
    
    func toMovie() -> Movie {
        return Movie(
            id: id,
            title: title,
            posterImage: poster_path.map { MovieDBConfig.imageBaseURL + $0 } ?? ""
        )
    }
}

struct MovieDetailDTO: Codable {
    let id: Int
    let title: String
    let release_date: String
    let vote_average: Double
    let overview: String
    let genres: [GenreDTO]
    let runtime: Int

    
    func toMovieDetail() -> MovieDetail {
        return MovieDetail(
            id: id,
            movieId: id,
            title: title,
            releaseDate: release_date,
            rating: vote_average,
            overview: overview,
            genres: genres.map { $0.name },
            duration: "\(runtime) min"
        )
    }
}



