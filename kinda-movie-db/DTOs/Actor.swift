//
//  cast.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/10/24.
//



struct ActorDetailDTO: Codable {
    let id: Int
    let name: String
    let profile_path: String?
    let biography: String
    let birthday: String?
    let place_of_birth: String?
    let known_for_department: String
    
    func toActorDetail() -> ActorDetail {
        return ActorDetail(
            id: id,
            actorId: id,
            name: name,
            profileImage: profile_path.map { MovieDBConfig.imageBaseURL + $0 } ?? "",
            biography: biography,
            birthDate: birthday ?? "Unknown",
            birthPlace: place_of_birth ?? "Unknown",
            stats: ActorStats(
                totalMovies: 0,
                awards: 0, // This info is not available in the API
                averageRating: 0
            )
        )
    }
}

struct ActorMovieCreditsDTO: Codable {
    let cast: [ActorMovieDTO]
}

struct ActorMovieDTO: Codable {
    let id: Int
    let title: String
    let poster_path: String?
    let vote_average: Double
    
    func toMovie() -> Movie {
        return Movie(
            id: id,
            title: title,
            posterImage: poster_path.map { MovieDBConfig.imageBaseURL + $0 } ?? ""
        )
    }
}
