//
//  PlayerView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct PlayerView: View {
    // MARK: - Properties
    @State var song: [SongModel] = []
    
    // MARK: - Body
    var body: some View {
        ZStack{
            
            BackgroundView()
            
            List{
                SongCell(name: "Name", author: "Author", time: "Time")
            }
            .listStyle(.plain)
            
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
