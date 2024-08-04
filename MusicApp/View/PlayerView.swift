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
    @State var showFiles = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
           
            ZStack{
                BackgroundView()
                
        /// List of Songs
                List{
                    ForEach(vm.songs){ song in
                        SongCell(song: song, durationFormatted: vm.durationFormatted)
                            .onTapGesture {
                                vm.playAuido(song: song)
                            }
                    }
                }
                .listStyle(.plain)
                
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
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
