//
//  AlbumModel.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/20/23.
//

import Foundation

struct AlbumModel: Codable, Equatable {
    let results: [Album]
}

struct Album: Codable, Equatable {
    let artistName: String
    let collectionName: String
    let artworkUrl100: String?
    let trackCount: Int
    let releaseDate: String
    let collectionId: Int
}
