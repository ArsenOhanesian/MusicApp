//
//  FontView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

extension Text{
    func nameFont() -> some View{
        self
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            
    }
    
    func artistFont() -> some View{
        self
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .light, design: .rounded))
    }
    
}

struct FontView: View {
    var body: some View {
        VStack{
            Text("Name Font")
                .nameFont()
            Text("Artist Font")
                .artistFont()
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView()
            .preferredColorScheme(.dark)
    }
}
