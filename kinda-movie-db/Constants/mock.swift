//
//  index.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/7/24.
//


let mockMovies = [
    Movie(id: 1, title: "The Great Escape", posterImage: "great_escape_poster.jpg"),
    Movie(id: 2, title: "Star Quest", posterImage: "star_quest_poster.jpg"),
    Movie(id: 3, title: "Lost in the Jungle", posterImage: "lost_jungle_poster.jpg"),
    Movie(id: 4, title: "City of Dreams", posterImage: "city_dreams_poster.jpg"),
    Movie(id: 5, title: "Shadows of the Past", posterImage: "shadows_past_poster.jpg"),
    Movie(id: 6, title: "Desert Storm", posterImage: "desert_storm_poster.jpg"),
    Movie(id: 7, title: "Rise of the Guardians", posterImage: "guardians_poster.jpg"),
    Movie(id: 8, title: "Ocean's Call", posterImage: "oceans_call_poster.jpg"),
    Movie(id: 9, title: "Beyond the Horizon", posterImage: "beyond_horizon_poster.jpg"),
    Movie(id: 10, title: "The Final Stand", posterImage: "final_stand_poster.jpg")
]

let mockMovieDetails = [
    MovieDetail(
           id: 1,
           movieId: 1,
           title: "The Great Escape",
           releaseDate: "1963-07-04",
           rating: 8.2,
           overview: "Allied prisoners of war plan to escape from a German camp during WWII.",
           genres: ["Adventure", "War", "History"],
           duration: "2h 52m",
           cast: [
               Actor(id: 1, name: "Steve McQueen", character: "Captain Virgil Hilts", image: "mcqueen.jpg"),
               Actor(id: 2, name: "James Garner", character: "Flight Lt. Hendley", image: "garner.jpg"),
               Actor(id: 3, name: "Richard Attenborough", character: "Squadron Leader Bartlett", image: "attenborough.jpg")
           ]
       ),
    MovieDetail(
            id: 2,
            movieId: 2,
            title: "Star Quest",
            releaseDate: "2012-05-10",
            rating: 7.5,
            overview: "Space explorers embark on a mission to a distant galaxy.",
            genres: ["Sci-Fi", "Adventure"],
            duration: "1h 45m",
            cast: [
                Actor(id: 4, name: "Emma Stone", character: "Captain Kara Ray", image: "stone.jpg"),
                Actor(id: 5, name: "Ryan Gosling", character: "Lt. Sam Beckett", image: "gosling.jpg")
            ]
        ),
        MovieDetail(
            id: 3,
            movieId: 3,
            title: "Lost in the Jungle",
            releaseDate: "2020-08-14",
            rating: 6.8,
            overview: "A thrilling adventure of survival in a dangerous jungle.",
            genres: ["Adventure", "Thriller"],
            duration: "2h 3m",
            cast: [
                Actor(id: 6, name: "Tom Holland", character: "Alex", image: "holland.jpg"),
                Actor(id: 7, name: "Zendaya", character: "Lily", image: "zendaya.jpg"),
                Actor(id: 8, name: "Chris Pratt", character: "Max", image: "pratt.jpg")
            ]
        ),
        MovieDetail(
            id: 4,
            movieId: 4,
            title: "City of Dreams",
            releaseDate: "2019-11-22",
            rating: 7.9,
            overview: "A journey through the ups and downs of life in the big city.",
            genres: ["Drama", "Romance"],
            duration: "1h 57m",
            cast: [
                Actor(id: 9, name: "Jennifer Lawrence", character: "Sarah", image: "lawrence.jpg"),
                Actor(id: 10, name: "Michael B. Jordan", character: "Ethan", image: "jordan.jpg")
            ]
        ),
        MovieDetail(
            id: 5,
            movieId: 5,
            title: "Shadows of the Past",
            releaseDate: "2018-10-13",
            rating: 8.0,
            overview: "An investigator unravels dark secrets in a small town.",
            genres: ["Mystery", "Thriller"],
            duration: "1h 52m",
            cast: [
                Actor(id: 11, name: "Emily Blunt", character: "Detective Claire", image: "blunt.jpg"),
                Actor(id: 12, name: "Jake Gyllenhaal", character: "Tom", image: "gyllenhaal.jpg")
            ]
        ),
        MovieDetail(
            id: 6,
            movieId: 6,
            title: "Desert Storm",
            releaseDate: "2017-03-15",
            rating: 6.5,
            overview: "A tale of survival and resilience in the harsh desert.",
            genres: ["Action", "Adventure"],
            duration: "1h 50m",
            cast: [
                Actor(id: 13, name: "Chris Hemsworth", character: "Jack", image: "hemsworth.jpg"),
                Actor(id: 14, name: "Scarlett Johansson", character: "Anna", image: "johansson.jpg")
            ]
        ),
        MovieDetail(
            id: 7,
            movieId: 7,
            title: "Rise of the Guardians",
            releaseDate: "2016-12-05",
            rating: 7.4,
            overview: "Guardians band together to protect the world from evil.",
            genres: ["Fantasy", "Action"],
            duration: "2h 10m",
            cast: [
                Actor(id: 15, name: "Robert Downey Jr.", character: "Marcus", image: "downey.jpg"),
                Actor(id: 16, name: "Chris Evans", character: "Evan", image: "evans.jpg"),
                Actor(id: 17, name: "Zoe Saldana", character: "Lena", image: "saldana.jpg")
            ]
        ),
        MovieDetail(
            id: 8,
            movieId: 8,
            title: "Ocean's Call",
            releaseDate: "2021-07-20",
            rating: 7.1,
            overview: "A diver discovers a mysterious underwater civilization.",
            genres: ["Adventure", "Fantasy"],
            duration: "1h 58m",
            cast: [
                Actor(id: 18, name: "Jason Momoa", character: "Finn", image: "momoa.jpg"),
                Actor(id: 19, name: "Amber Heard", character: "Mira", image: "heard.jpg")
            ]
        ),
        MovieDetail(
            id: 9,
            movieId: 9,
            title: "Beyond the Horizon",
            releaseDate: "2022-06-17",
            rating: 8.3,
            overview: "A journey to explore unknown lands beyond the horizon.",
            genres: ["Adventure", "Drama"],
            duration: "2h 15m",
            cast: [
                Actor(id: 20, name: "Matt Damon", character: "Dr. Smith", image: "damon.jpg"),
                Actor(id: 11, name: "Emily Blunt", character: "Lucy", image: "blunt.jpg"),
                Actor(id: 21, name: "Jessica Chastain", character: "Dr. Reyes", image: "chastain.jpg")
            ]
        ),
        MovieDetail(
            id: 10,
            movieId: 10,
            title: "The Final Stand",
            releaseDate: "2015-02-19",
            rating: 6.9,
            overview: "A team of soldiers make a stand against overwhelming odds.",
            genres: ["Action", "War"],
            duration: "1h 40m",
            cast: [
                Actor(id: 22, name: "Mark Wahlberg", character: "Lt. Logan", image: "wahlberg.jpg"),
                Actor(id: 23, name: "Charlize Theron", character: "Sarah", image: "theron.jpg"),
                Actor(id: 24, name: "Tom Hardy", character: "Sgt. Miller", image: "hardy.jpg")
            ]
        )
]



let mockActorDetails = [
    ActorDetail(
        id: 1,
        actorId: 1,
        name: "Steve McQueen",
        profileImage: "mcqueen_profile.jpg",
        biography: "An American actor known for his roles in action-packed movies in the 60s and 70s.",
        birthDate: "1930-03-24",
        birthPlace: "Beech Grove, Indiana, USA",
        knownFor: [
            Movie(id: 1, title: "The Great Escape", posterImage: "great_escape_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 50, awards: 12, averageRating: 7.8)
    ),
    ActorDetail(
        id: 2,
        actorId: 2,
        name: "James Garner",
        profileImage: "garner_profile.jpg",
        biography: "American actor, producer, and voice artist, best known for his roles in comedy-dramas.",
        birthDate: "1928-04-07",
        birthPlace: "Norman, Oklahoma, USA",
        knownFor: [
            Movie(id: 1, title: "The Great Escape", posterImage: "great_escape_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 60, awards: 8, averageRating: 7.5)
    ),
    ActorDetail(
        id: 3,
        actorId: 3,
        name: "Richard Attenborough",
        profileImage: "attenborough_profile.jpg",
        biography: "An English actor, filmmaker, and entrepreneur who appeared in films and directed award-winning movies.",
        birthDate: "1923-08-29",
        birthPlace: "Cambridge, England",
        knownFor: [
            Movie(id: 1, title: "The Great Escape", posterImage: "great_escape_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 75, awards: 15, averageRating: 8.0)
    ),
    ActorDetail(
        id: 4,
        actorId: 4,
        name: "Emma Stone",
        profileImage: "stone_profile.jpg",
        biography: "An acclaimed American actress known for her roles in comedy and drama films.",
        birthDate: "1988-11-06",
        birthPlace: "Scottsdale, Arizona, USA",
        knownFor: [
            Movie(id: 2, title: "Star Quest", posterImage: "star_quest_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 30, awards: 10, averageRating: 7.6)
    ),
    ActorDetail(
        id: 5,
        actorId: 5,
        name: "Ryan Gosling",
        profileImage: "gosling_profile.jpg",
        biography: "Canadian actor and musician known for his roles in both independent and blockbuster films.",
        birthDate: "1980-11-12",
        birthPlace: "London, Ontario, Canada",
        knownFor: [
            Movie(id: 2, title: "Star Quest", posterImage: "star_quest_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 40, awards: 9, averageRating: 7.7)
    ),
    ActorDetail(
        id: 6,
        actorId: 6,
        name: "Tom Holland",
        profileImage: "holland_profile.jpg",
        biography: "An English actor known for playing Spider-Man in the Marvel Cinematic Universe.",
        birthDate: "1996-06-01",
        birthPlace: "Kingston upon Thames, England",
        knownFor: [
            Movie(id: 3, title: "Lost in the Jungle", posterImage: "lost_jungle_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 20, awards: 5, averageRating: 7.4)
    ),
    ActorDetail(
        id: 7,
        actorId: 7,
        name: "Zendaya",
        profileImage: "zendaya_profile.jpg",
        biography: "American actress and singer, acclaimed for her roles in drama and action films.",
        birthDate: "1996-09-01",
        birthPlace: "Oakland, California, USA",
        knownFor: [
            Movie(id: 3, title: "Lost in the Jungle", posterImage: "lost_jungle_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 18, awards: 6, averageRating: 7.8)
    ),
    ActorDetail(
        id: 8,
        actorId: 8,
        name: "Chris Pratt",
        profileImage: "pratt_profile.jpg",
        biography: "An American actor known for his roles in action and sci-fi films.",
        birthDate: "1979-06-21",
        birthPlace: "Virginia, Minnesota, USA",
        knownFor: [
            Movie(id: 3, title: "Lost in the Jungle", posterImage: "lost_jungle_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 25, awards: 4, averageRating: 7.5)
    ),
    ActorDetail(
        id: 9,
        actorId: 9,
        name: "Jennifer Lawrence",
        profileImage: "lawrence_profile.jpg",
        biography: "An Academy Award-winning American actress known for her roles in diverse genres.",
        birthDate: "1990-08-15",
        birthPlace: "Indian Hills, Kentucky, USA",
        knownFor: [
            Movie(id: 4, title: "City of Dreams", posterImage: "city_dreams_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 35, awards: 11, averageRating: 7.9)
    ),
    ActorDetail(
        id: 10,
        actorId: 10,
        name: "Michael B. Jordan",
        profileImage: "jordan_profile.jpg",
        biography: "An American actor and producer known for his roles in drama and action films.",
        birthDate: "1987-02-09",
        birthPlace: "Santa Ana, California, USA",
        knownFor: [
            Movie(id: 4, title: "City of Dreams", posterImage: "city_dreams_poster.jpg")
        ],
        stats: ActorStats(totalMovies: 28, awards: 7, averageRating: 7.6)
    ),
    ActorDetail(
           id: 11,
           actorId: 11,
           name: "Emily Blunt",
           profileImage: "blunt_profile.jpg",
           biography: "A British-American actress known for her versatility in films ranging from drama to action.",
           birthDate: "1983-02-23",
           birthPlace: "London, England",
           knownFor: [
               Movie(id: 5, title: "Shadows of the Past", posterImage: "shadows_past_poster.jpg"),
               Movie(id: 9, title: "Beyond the Horizon", posterImage: "beyond_horizon_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 32, awards: 10, averageRating: 8.1)
       ),
       ActorDetail(
           id: 12,
           actorId: 12,
           name: "Jake Gyllenhaal",
           profileImage: "gyllenhaal_profile.jpg",
           biography: "An acclaimed American actor known for his intense and transformative roles in film.",
           birthDate: "1980-12-19",
           birthPlace: "Los Angeles, California, USA",
           knownFor: [
               Movie(id: 5, title: "Shadows of the Past", posterImage: "shadows_past_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 40, awards: 6, averageRating: 7.9)
       ),
       ActorDetail(
           id: 13,
           actorId: 13,
           name: "Chris Hemsworth",
           profileImage: "hemsworth_profile.jpg",
           biography: "An Australian actor best known for his role as Thor in the Marvel Cinematic Universe.",
           birthDate: "1983-08-11",
           birthPlace: "Melbourne, Australia",
           knownFor: [
               Movie(id: 6, title: "Desert Storm", posterImage: "desert_storm_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 30, awards: 8, averageRating: 7.5)
       ),
       ActorDetail(
           id: 14,
           actorId: 14,
           name: "Scarlett Johansson",
           profileImage: "johansson_profile.jpg",
           biography: "An American actress known for her roles in blockbuster films and independent dramas.",
           birthDate: "1984-11-22",
           birthPlace: "New York City, New York, USA",
           knownFor: [
               Movie(id: 6, title: "Desert Storm", posterImage: "desert_storm_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 45, awards: 12, averageRating: 8.0)
       ),
       ActorDetail(
           id: 15,
           actorId: 15,
           name: "Robert Downey Jr.",
           profileImage: "downey_profile.jpg",
           biography: "An American actor and producer famous for his role as Iron Man in the Marvel films.",
           birthDate: "1965-04-04",
           birthPlace: "New York City, New York, USA",
           knownFor: [
               Movie(id: 7, title: "Rise of the Guardians", posterImage: "guardians_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 50, awards: 15, averageRating: 8.3)
       ),
       ActorDetail(
           id: 16,
           actorId: 16,
           name: "Chris Evans",
           profileImage: "evans_profile.jpg",
           biography: "An American actor known for his roles in superhero films and comedies.",
           birthDate: "1981-06-13",
           birthPlace: "Boston, Massachusetts, USA",
           knownFor: [
               Movie(id: 7, title: "Rise of the Guardians", posterImage: "guardians_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 35, awards: 7, averageRating: 7.8)
       ),
       ActorDetail(
           id: 17,
           actorId: 17,
           name: "Zoe Saldana",
           profileImage: "saldana_profile.jpg",
           biography: "An American actress known for her roles in sci-fi blockbusters and action films.",
           birthDate: "1978-06-19",
           birthPlace: "Passaic, New Jersey, USA",
           knownFor: [
               Movie(id: 7, title: "Rise of the Guardians", posterImage: "guardians_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 28, awards: 5, averageRating: 7.6)
       ),
       ActorDetail(
           id: 18,
           actorId: 18,
           name: "Jason Momoa",
           profileImage: "momoa_profile.jpg",
           biography: "An American actor known for his roles in action and adventure films.",
           birthDate: "1979-08-01",
           birthPlace: "Honolulu, Hawaii, USA",
           knownFor: [
               Movie(id: 8, title: "Ocean's Call", posterImage: "oceans_call_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 20, awards: 3, averageRating: 7.3)
       ),
       ActorDetail(
           id: 19,
           actorId: 19,
           name: "Amber Heard",
           profileImage: "heard_profile.jpg",
           biography: "An American actress known for her roles in action and drama films.",
           birthDate: "1986-04-22",
           birthPlace: "Austin, Texas, USA",
           knownFor: [
               Movie(id: 8, title: "Ocean's Call", posterImage: "oceans_call_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 15, awards: 4, averageRating: 7.2)
       ),
       ActorDetail(
           id: 20,
           actorId: 20,
           name: "Matt Damon",
           profileImage: "damon_profile.jpg",
           biography: "An American actor and producer, known for his roles in action and thriller films.",
           birthDate: "1970-10-08",
           birthPlace: "Cambridge, Massachusetts, USA",
           knownFor: [
               Movie(id: 9, title: "Beyond the Horizon", posterImage: "beyond_horizon_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 40, awards: 9, averageRating: 7.9)
       ),
       ActorDetail(
           id: 21,
           actorId: 21,
           name: "Jessica Chastain",
           profileImage: "chastain_profile.jpg",
           biography: "An American actress and producer known for her performances in dramatic roles.",
           birthDate: "1977-03-24",
           birthPlace: "Sacramento, California, USA",
           knownFor: [
               Movie(id: 9, title: "Beyond the Horizon", posterImage: "beyond_horizon_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 22, awards: 8, averageRating: 8.1)
       ),
       ActorDetail(
           id: 22,
           actorId: 22,
           name: "Mark Wahlberg",
           profileImage: "wahlberg_profile.jpg",
           biography: "An American actor and producer known for his action and drama films.",
           birthDate: "1971-06-05",
           birthPlace: "Boston, Massachusetts, USA",
           knownFor: [
               Movie(id: 10, title: "The Final Stand", posterImage: "final_stand_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 42, awards: 10, averageRating: 7.4)
       ),
       ActorDetail(
           id: 23,
           actorId: 23,
           name: "Charlize Theron",
           profileImage: "theron_profile.jpg",
           biography: "A South African and American actress and producer known for her roles in action and drama films.",
           birthDate: "1975-08-07",
           birthPlace: "Benoni, South Africa",
           knownFor: [
               Movie(id: 10, title: "The Final Stand", posterImage: "final_stand_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 33, awards: 15, averageRating: 8.0)
       ),
       ActorDetail(
           id: 24,
           actorId: 24,
           name: "Tom Hardy",
           profileImage: "hardy_profile.jpg",
           biography: "An English actor and producer, known for his intense roles in both film and television.",
           birthDate: "1977-09-15",
           birthPlace: "Hammersmith, London, England",
           knownFor: [
               Movie(id: 10, title: "The Final Stand", posterImage: "final_stand_poster.jpg")
           ],
           stats: ActorStats(totalMovies: 27, awards: 7, averageRating: 7.8)
       )
]
