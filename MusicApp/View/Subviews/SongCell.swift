//
//  MusicCell.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct SongCell: View{
    // MARK: - Properties
    let song: SongModel
    let durationFormatted: (TimeInterval) -> String
    
    // MARK: - Body
    var body: some View{
        HStack{
            if let data = song.coverImage, let uiImage = UIImage(data: data){
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            else{
                ZStack{
                    Color.gray
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: "music.note")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundStyle(.white)
                }
                .cornerRadius(10)
            }
            
            
            VStack (alignment: .leading){
                Text(song.name)
                    .nameFont()
                Text(song.author ?? "Unknown Artist")
                    .artistFont()
            }
            
            Spacer()
            if let duration = song.duration{
                Text(durationFormatted(duration))
                    .artistFont()
            }
            
            
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    PlayerView()
}

