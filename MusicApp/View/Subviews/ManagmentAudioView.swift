//
//  ManagmentAudioView.swift
//  MusicApp
//
//  Created by csd_setup on 04.08.2024.
//

import SwiftUI

struct ManagmentAudioView: View {
    // MARK: - Properties
    let isSongPlaying: Bool
    let pauseAction: () -> ()
    let forwardAction: () -> ()
    let backwardAction: () -> ()
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 40){
            CustomButton(img: "backward.end.fill", 
                         size: .title2,
                         action: backwardAction)
            
            CustomButton(img: isSongPlaying ? "pause.circle.fill" : "play.circle.fill",
                         size: .largeTitle, 
                         action: pauseAction)
            
            CustomButton(img: "forward.end.fill", 
                         size: .title2,
                         action: forwardAction)
        }
    }
}

#Preview {
    ManagmentAudioView(isSongPlaying: true, pauseAction: {}, forwardAction: {}, backwardAction: {})
        .preferredColorScheme(.dark)
}
