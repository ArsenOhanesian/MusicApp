//
//  ViewModel.swift
//  MusicApp
//
//  Created by arsen on 02.08.2024.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var songs: [SongModel] = []
    
}
