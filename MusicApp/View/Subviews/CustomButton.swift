//
//  CustomButton.swift
//  MusicApp
//
//  Created by csd_setup on 04.08.2024.
//

import SwiftUI

struct CustomButton: View {
    // MARK: - Properties
    let img: String
    let size: Font
    let action: () -> ()
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image(systemName: img)
                .foregroundStyle(.white)
                .font(size)
        }
    }
}

#Preview {
    CustomButton(img: "play.fill", size: .title, action: {})
}
