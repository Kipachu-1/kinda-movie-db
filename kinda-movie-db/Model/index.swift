//
//  common.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/7/24.
//

struct Movie {
    let id: Int
    let title: String
    let posterImage: String
}


struct Actor {
    let id: Int
    let name: String
    let character: String
    let image: String
}

struct ActorDetail {
    let id: Int
    let actorId: Int
    let name: String
    let profileImage: String
    let biography: String
    let birthDate: String
    let birthPlace: String
    let stats: ActorStats
}

struct ActorStats {
    let totalMovies: Int
    let awards: Int
    let averageRating: Double
}

struct MovieDetail {
    let id: Int
    let movieId: Int
    let title: String
    let releaseDate: String
    let rating: Double
    let overview: String
    let genres: [String]
    let duration: String
}

