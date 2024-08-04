//
//  PlayerView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct PlayerView: View {
    // MARK: - Properties
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
                
        /// List of Songs
                VStack {
                    List{
                        ForEach(vm.songs){ song in
                            SongCell(song: song, durationFormatted: vm.durationFormatted)
                                .onTapGesture {
                                    vm.playAuido(song: song)
                                }
                        }
                    }
                    .listStyle(.plain)

                    Spacer()
                    // MARK: - Player
                    VStack{
                        /// Compact Player
                        HStack{
                            Color.gray
                                .frame(width: frameImage, height: frameImage)
                            
                            
                            if !showFullPlayer{
                                
                                VStack(alignment: .leading){
                                    Text("Name of song")
                                        .nameFont()
                                    Text("Author")
                                        .artistFont()
                                    
                                }
                                .matchedGeometryEffect(id: "Description", in: playAnimation)
                                
                                Spacer()
                                
                                CustomButton(img: "play.fill", size: .title) {
                                    
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
                            VStack{
                              Text("Name")
                                    .nameFont()
                                Text("Artist")
                                    .artistFont()
                            }
                            .matchedGeometryEffect(id: "Description", in: playAnimation)
                            .padding(.top)
                            
                            /// Duration song
                            VStack {
                                HStack{
                                    Text("00:00")
                                    Spacer()
                                    Text("03:27")
                                        
                                }
                                .durationFont()
                                .padding()
                                
                                /// Slider
                                Divider()
                                
                                
                                HStack(spacing: 40){
                                    CustomButton(img: "backward.end.fill", size: .title2) {
                                        
                                    }
                                    
                                    CustomButton(img: "play.circle.fill", size: .largeTitle) {
                                        
                                    }
                                    
                                    CustomButton(img: "forward.end.fill", size: .title2) {
                                        
                                    }
                                }
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
                ImportFileManager(songs: $vm.songs)
            })

        }
    }
    
    // MARK: - Methods
    private func CustomButton(img: String, size: Font ,action: @escaping () -> () ) -> some View{
        Button(action: action) {
            Image(systemName: img)
                .foregroundStyle(.white)
                .font(size)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
