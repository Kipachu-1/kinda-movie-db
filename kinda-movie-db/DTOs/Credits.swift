//
//  credits.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/10/24.
//


struct CreditsDTO: Codable {
    let cast: [CastDTO]
}

struct MovieCreditsDTO: Codable {
    let id: Int
    let cast: [CastDTO]
}

