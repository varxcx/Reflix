//
//  MoviesController.swift
//  Reflix
//
//  Created by Vardhan Chopada on 12/8/22.
//

import UIKit


//For Parsing Json Data

struct Result: Codable {
    var MovieList: [ResultItem]
}

struct ResultItem: Codable {
   var Title: String
   var Year: String
   var Summary: String
   var ShortSummary: String
   var Genres: String
   var IMDBID: String
   var Runtime: String
   var YouTubeTrailer: String?
   var Rating: String
   var MoviePoster: String
   var Director: String
   var Writers: String
   var Cast: String
}

