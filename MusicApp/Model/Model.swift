//
//  Model.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import Foundation

struct SongModel: Identifiable{
    var id = UUID()
    var name: String
    var data: Data
    var author: String?
    var coverImage: Data?
    var duration: TimeInterval?
}
