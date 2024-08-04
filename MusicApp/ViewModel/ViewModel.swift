//
//  ViewModel.swift
//  MusicApp
//
//  Created by arsen on 02.08.2024.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var songs: [SongModel] = []
    
    
    func durationFormatted(_ duration: TimeInterval) -> String{
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.minute, .second]
        timeFormatter.unitsStyle = .positional
        timeFormatter.zeroFormattingBehavior = .pad
        
        return timeFormatter.string(from: duration) ?? ""
    }
}
