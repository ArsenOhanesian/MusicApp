//
//  DescriptionView.swift
//  MusicApp
//
//  Created by csd_setup on 04.08.2024.
//

import SwiftUI

struct DescriptionView: View {
    // MARK: - Properties
    let currentSong: SongModel?
    @Namespace var playAnimation
    
    // MARK: - Body
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
