//
//  SongsModel.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/21/23.
//

import Foundation

struct SongsModel: Codable {
    let results: [Song]
}

struct Song: Codable {
    let trackName: String?
}
