//
//  Movie.swift
//  MovieDb1
//
//  Created by Kaan Yalçınkaya on 7.01.2022.
//

import Foundation

// MARK: - Artist
class Artist: Codable {
    let dates: Dates?
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?
    let name: String?
    let founded: Int?
    let members: [String]?
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case name, founded, members
    }
    
    init(dates: Dates?, page: Int?, results: [Result]?, totalPages: Int?, totalResults: Int?, name: String?, founded: Int?, members: [String]?) {
        self.dates = dates
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
        self.name = name
        self.founded = founded
        self.members = members
    }
}

// MARK: - Dates
class Dates: Codable {
    let maximum, minimum: String?
    
    init(maximum: String?, minimum: String?) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

// MARK: - Result
class Result: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(adult: Bool?, backdropPath: String?, genreIDS: [Int]?, id: Int?, originalLanguage: OriginalLanguage?, originalTitle: String?, overview: String?, popularity: Double?, posterPath: String?, releaseDate: String?, title: String?, video: Bool?, voteAverage: Double?, voteCount: Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case fr = "fr"
}

// MARK: - Album
class Album: Codable {
    let name: String?
    let artist: ArtistClass?
    let tracks: [Track]?
    
    init(name: String?, artist: ArtistClass?, tracks: [Track]?) {
        self.name = name
        self.artist = artist
        self.tracks = tracks
    }
}

// MARK: - ArtistClass
class ArtistClass: Codable {
    let name: String?
    let founded: Int?
    let members: [String]?
    
    init(name: String?, founded: Int?, members: [String]?) {
        self.name = name
        self.founded = founded
        self.members = members
    }
}

// MARK: - Track
class Track: Codable {
    let name: String?
    let duration: Int?
    
    init(name: String?, duration: Int?) {
        self.name = name
        self.duration = duration
    }
}
