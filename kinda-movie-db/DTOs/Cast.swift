//
//  cast.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/10/24.
//

struct CastDTO: Codable {
    let id: Int
    let name: String
    let character: String
    let profile_path: String?
    
    func toActor() -> Actor {
        return Actor(
            id: id,
            name: name,
            character: character,
            image: profile_path.map { MovieDBConfig.imageBaseURL + $0 } ?? ""
        )
    }
}
