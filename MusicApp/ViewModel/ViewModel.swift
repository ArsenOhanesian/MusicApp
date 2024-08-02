//
//  ViewModel.swift
//  MusicApp
//
//  Created by arsen on 02.08.2024.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var songs: [SongModel] = [
        SongModel(name: "Chop Suey",
                  data: Data(),
                  author: "System of a down",
                  coverImage: Data(),
                  duration: 0),
        SongModel(name: "Varmolion",
                  data: Data(),
                  author: "Slipknot",
                  coverImage: Data(),
                  duration: 0),
        SongModel(name: "Fields of gold",
                  data: Data(),
                  author: "Sting",
                  coverImage: Data(),
                  duration: 0),]
    
    
}
