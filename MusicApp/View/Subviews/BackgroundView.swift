//
//  BackgroundView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct BackgroundView: View {

    // MARK: - Body
    var body: some View{
        LinearGradient(
            colors: [.topBackground, .bottomBackground],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
