//
//  MovieDB.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/10/24.
//

import Foundation

// MARK: - API Configuration
struct MovieDBConfig {
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = Config.movieServiceApiKey
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
}

// MARK: - API Endpoints
enum MovieDBEndpoint {
    case popularMovies(page: Int)
    case movieDetails(id: Int)
    case actorDetails(id: Int)
    case movieCredits(id: Int)
    case actorMovies(id: Int)
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/movie/popular"
        case .movieDetails(let id):
            return "/movie/\(id)"
        case .movieCredits(let id):
            return "/movie/\(id)/credits"
        case .actorDetails(let id):
            return "/person/\(id)"
        case .actorMovies(let id):
            return "/person/\(id)/movie_credits"
        }
    }
    
    var url: URL? {
           var components = URLComponents(string: MovieDBConfig.baseURL + path)
           
           // Only add page parameter for popular movies
           switch self {
           case .popularMovies(let page):
               components?.queryItems = [
                   URLQueryItem(name: "page", value: "\(page)")
               ]
           default:
               break
           }
           
           return components?.url
       }
       
       // Create URLRequest with authorization header
       var urlRequest: URLRequest? {
           guard let url = url else { return nil }
           
           var request = URLRequest(url: url)
           request.setValue("Bearer \(MovieDBConfig.apiKey)", forHTTPHeaderField: "Authorization")
           request.setValue("application/json", forHTTPHeaderField: "Accept")
           return request
       }
}

// MARK: - Network Error
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
}

// MARK: - API Response Models
struct MovieResponse: Codable {
    let page: Int
    let results: [MovieDTO]
}



// MARK: - MovieDB Service
protocol MovieDBServiceProtocol {
    func fetchPopularMovies(page: Int) async throws -> [Movie]
    func fetchMovieDetails(id: Int) async throws -> MovieDetail
    func fetchActorDetails(id: Int) async throws -> ActorDetail
    func fetchMovieCredits(id: Int) async throws -> [Actor]
    func fetchActorMovies(id: Int) async throws -> [Movie]
}

class MovieDBService: MovieDBServiceProtocol {
    static let shared = MovieDBService()
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func fetch<T: Decodable>(endpoint: MovieDBEndpoint) async throws -> T {
        guard let request = endpoint.urlRequest else {
                  throw NetworkError.invalidURL
              }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Invalid response")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func fetchPopularMovies(page: Int) async throws -> [Movie] {
        let response: MovieResponse = try await fetch(endpoint: .popularMovies(page: page))
        return response.results.map { $0.toMovie() }
    }
    
    func fetchMovieDetails(id: Int) async throws -> MovieDetail {
        let movieDetail: MovieDetailDTO = try await fetch(endpoint: .movieDetails(id: id))
        return movieDetail.toMovieDetail()
    }
    
    func fetchActorDetails(id: Int) async throws -> ActorDetail {
        let actorDetail: ActorDetailDTO = try await fetch(endpoint: .actorDetails(id: id))
        return actorDetail.toActorDetail()
    }
    
    func fetchMovieCredits(id: Int) async throws -> [Actor] {
        let credits: MovieCreditsDTO = try await fetch(endpoint: .movieCredits(id: id))
        return credits.cast.map { $0.toActor() }
    }
    
    func fetchActorMovies(id: Int) async throws -> [Movie] {
        let credits: ActorMovieCreditsDTO = try await fetch(endpoint: .actorMovies(id: id))
        return credits.cast.map { $0.toMovie() }
    }
}
