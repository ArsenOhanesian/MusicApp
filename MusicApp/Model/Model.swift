//
//  Model.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import Foundation

struct SongModel: Identifiable{
    let id = UUID()
    let name: String
    let data: Data
    let author: String?
    let coverImage: Data?
    let duration: TimeInterval?
}
