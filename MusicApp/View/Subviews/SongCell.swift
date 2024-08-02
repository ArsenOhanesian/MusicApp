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
    
    // MARK: - Body
    var body: some View{
        HStack{
            Color.white
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            
            
            VStack (alignment: .leading){
                Text(song.name)
                    .nameFont()
                Text(song.author ?? "Unknown Artist")
                    .artistFont()
            }
            
            Spacer()
            
            Text("03:48")
                .artistFont()
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}


// MARK: - Preview
struct MusicCell_Previews: PreviewProvider {
    static var previews: some View {
        SongCell(song: SongModel(name: "JS", data: Data(), author: nil, coverImage: Data(), duration: 0))
    }
}

