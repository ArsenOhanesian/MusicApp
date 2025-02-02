//
//  Model.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import Foundation
import RealmSwift

//struct SongModel: Identifiable{
//    var id = UUID()
//    var name: String
//    var data: Data
//    var author: String?
//    var coverImage: Data?
//    var duration: TimeInterval?
//}

class SongModel: Object, ObjectKeyIdentifiable{
   
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var data: Data
    @Persisted var author: String?
    @Persisted var coverImage: Data?
    @Persisted var duration: TimeInterval?
    
    convenience init(name: String, data: Data, author: String? = nil, coverImage: Data? = nil, duration: TimeInterval? = nil) {
        self.init()
        self.name = name
        self.data = data
        self.author = author
        self.coverImage = coverImage
        self.duration = duration
    }
}
