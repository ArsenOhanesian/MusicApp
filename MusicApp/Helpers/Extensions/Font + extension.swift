//
//  FontView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct DurationFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .light, design: .rounded))
    }
}

extension View{
    func durationFont() -> some View{
        self.modifier(DurationFontModifier())
    }
}

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
            
            HStack{
                Text("00:00")
                Spacer()
                Text("03:27")
                    
            }
            .durationFont()
            .padding()
        }
        
       
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView()
            .preferredColorScheme(.dark)
    }
}
