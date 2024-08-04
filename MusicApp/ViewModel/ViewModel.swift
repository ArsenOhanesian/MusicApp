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
    @Published var currentIndexOfSong: Int?
    @Published var currentTime: TimeInterval = 0.0
    @Published var durationTime: TimeInterval = 0.0
    
    var currentSong: SongModel? {
        guard let currentIndex = currentIndexOfSong, songs.indices.contains(currentIndex) else { return nil }
        return songs[currentIndex]
    }
    
    // MARK: - Methods
    func playAuido(song: SongModel){
        do{
            self.audioPlayer = try AVAudioPlayer(data: song.data)
            self.audioPlayer?.play()
            isSongPlaying = true
            durationTime = audioPlayer?.duration ?? 0.0
            if let index = songs.firstIndex(where: { $0.id == song.id }){
                currentIndexOfSong = index
            }
        } catch {
            print("Error in audio playback: \(error.localizedDescription)")
        }
    }
    
    func playPauseAudio(){
        if isSongPlaying{
            self.audioPlayer?.pause()
            
        }
        else{
            self.audioPlayer?.play()
        }
        isSongPlaying.toggle()
    }
    
    func forwardAudio(){
        guard let index = currentIndexOfSong else { return }
        let nextIndex = index + 1 < songs.count ? index + 1 : 0
        playAuido(song: songs[nextIndex])
    }
    
    func backwardAudio(){
        guard let index = currentIndexOfSong else { return }
        let previousIndex = index - 1 >= 0 ? index - 1 : songs.count - 1
        playAuido(song: songs[previousIndex])
    }
    
    func seekAudio(time: TimeInterval){
        self.audioPlayer?.currentTime = time
    }
    
    func updateProgress() {
        guard let player = audioPlayer else { return }
        currentTime = player.currentTime
    }
    
    func durationFormatted(_ duration: TimeInterval) -> String{
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.minute, .second]
        timeFormatter.unitsStyle = .positional
        timeFormatter.zeroFormattingBehavior = .pad
        
        return timeFormatter.string(from: duration) ?? ""
    }
}
