//
//  CoverImageView.swift
//  MusicApp
//
//  Created by csd_setup on 04.08.2024.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - Properties
    let currentSong : SongModel?
    let frameImage: CGFloat
    
    // MARK: - Body
    var body: some View {
        if let data = currentSong?.coverImage, let uiImage = UIImage(data: data){
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: frameImage, height: frameImage)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else{
            ZStack {
                Color.gray
                    .frame(width: frameImage, height: frameImage)
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: frameImage / 2)
                    .foregroundStyle(.white)
            }
            .cornerRadius(10)
            
        }
    }
}


#Preview {
    CoverImageView(currentSong: SongModel(name: "Lala", data: Data()), frameImage: 50)
}
