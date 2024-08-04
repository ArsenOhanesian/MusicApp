//
//  ViewModel.swift
//  MusicApp
//
//  Created by arsen on 02.08.2024.
//

import Foundation
import AVFAudio

class ViewModel: ObservableObject{
    // MARK: - Propeties
    @Published var songs: [SongModel] = []
    @Published var audioPlayer: AVAudioPlayer?
    @Published var isSongPlaying: Bool = false
    
    // MARK: - Methods
    func playAuido(song: SongModel){
        do{
            self.audioPlayer = try AVAudioPlayer(data: song.data)
            self.audioPlayer?.play()
            isSongPlaying = true
        } catch {
            print("Error in audio playback: \(error.localizedDescription)")
        }
    }
    
    func durationFormatted(_ duration: TimeInterval) -> String{
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.minute, .second]
        timeFormatter.unitsStyle = .positional
        timeFormatter.zeroFormattingBehavior = .pad
        
        return timeFormatter.string(from: duration) ?? ""
    }
}
