//
//  ManagmentAudioView.swift
//  MusicApp
//
//  Created by csd_setup on 04.08.2024.
//

import SwiftUI

struct ManagmentAudioView: View {
    var body: some View {
        HStack(spacing: 40){
            CustomButton(img: "backward.end.fill", size: .title2) {
                
            }
            
            CustomButton(img: "play.circle.fill", size: .largeTitle) {
                
            }
            
            CustomButton(img: "forward.end.fill", size: .title2) {
                
            }
        }
    }
}

#Preview {
    ManagmentAudioView()
        .preferredColorScheme(.dark)
}
