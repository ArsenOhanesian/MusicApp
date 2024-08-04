//
//  DescriptionView.swift
//  MusicApp
//
//  Created by csd_setup on 04.08.2024.
//

import SwiftUI

struct DescriptionView: View {
    let currentSong: SongModel?
    @Namespace var playAnimation
    
    var body: some View {
        VStack{
            if let currentSong = currentSong{
                Text(currentSong.name)
                    .nameFont()
                Text(currentSong.author ?? "Unknown Artist")
                    .artistFont()
            }
        }
        .matchedGeometryEffect(id: "Description", in: playAnimation)
    }
}

#Preview {
    DescriptionView(currentSong: nil)
}
