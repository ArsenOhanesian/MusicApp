//
//  PlayerView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI
import RealmSwift

struct PlayerView: View {
    // MARK: - Properties
    @ObservedResults(SongModel.self) var songs
    @StateObject var vm = ViewModel()
    @State private var showFiles = false
    @State private var showFullPlayer = false
    @Namespace private var playAnimation
    
    var frameImage: CGFloat {
        showFullPlayer ? 320 : 50
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
           
            ZStack{
                BackgroundView()
                
                // MARK: - List of Songs
                VStack {
                    List{
                        ForEach(songs){ song in
                            SongCell(song: song, durationFormatted: vm.durationFormatted)
                                .onTapGesture {
                                    vm.playAuido(song: song)
                                    
                                }
                        }
                        .onDelete { indexSet in
                            vm.stopAudio()
                            $songs.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    
                    // MARK: - Player
                    if vm.currentSong != nil {
                        Player()
                    }
                }
            }
            // MARK: - Navigation Bar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showFiles.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }

                }
            }
            // MARK: File's Sheet
            .sheet(isPresented: $showFiles, content: {
                ImportFileManager()
            })

        }
    }
    
    // MARK: - Methods
    @ViewBuilder
    private func Player() -> some View{
        VStack{
            /// Compact Player
            HStack{
                CoverImageView(currentSong: vm.currentSong, frameImage: frameImage)
                
                if !showFullPlayer{
                    DescriptionView(currentSong: vm.currentSong)
                    Spacer()
                    CustomButton(img: vm.isSongPlaying ? "pause.fill" : "play.fill", 
                                 size: .title) {
                        vm.playPauseAudio()
                    }
                }
                
                
            }
            .padding()
            .background(showFullPlayer ? .clear : .black.opacity(0.3))
            .cornerRadius(10)
            .padding()
            
            /// Full Player
            
            if showFullPlayer {
                /// Description song
                DescriptionView(currentSong: vm.currentSong)
                .padding(.top)
                
                /// Duration song
                VStack {
                    HStack{
                        Text("\(vm.durationFormatted(vm.currentTime))")
                        Spacer()
                        Text("\(vm.durationFormatted(vm.durationTime))")
                        
                    }
                    .durationFont()
                    .padding()
                    
                    /// Slider
                    Slider(value: $vm.currentTime, in: 0...vm.durationTime){ editing in
                        
                        if !editing{
                            vm.seekAudio(time: vm.currentTime)
                        }
                    }
                    .offset(y: -18)
                    .accentColor(.white)
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            vm.updateProgress()
                        }
                    }
                    
                    
                    ManagmentAudioView(isSongPlaying: vm.isSongPlaying, 
                                       pauseAction: vm.playPauseAudio,
                                       forwardAction: vm.forwardAudio,
                                       backwardAction: vm.backwardAudio)
                }
                .padding(.horizontal, 40)
                
            }
        }
        .frame(height: showFullPlayer
               ? SizeConstants.fullPlayer
               : SizeConstants.compactPlayer)
        .onTapGesture {
            withAnimation(.spring) {
                self.showFullPlayer.toggle()
            }
        }
    }
}

#Preview {
    PlayerView()
}




