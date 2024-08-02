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
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                BackgroundView()
                
                /// List of SOngs
                List{
                    ForEach(vm.songs){ song in
                        SongCell(song: song)
                    }
                }
                .listStyle(.plain)
                
            }
            
            // MARK: - Navigation Bar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }

                }
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .preferredColorScheme(.dark)
    }
}
