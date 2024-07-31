//
//  ContentView.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct PlayerView: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        ZStack{
            
            BackgroundView()
            
            List{
                HStack{
                    Color.white
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                    
                    VStack (alignment: .leading){
                        Text("Name")
                            .nameFont()
                        Text("Author")
                            .artistFont()
                    }
                    
                    Spacer()
                    
                    Text("Time")
                        .artistFont()
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
        }
    }
}



// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .preferredColorScheme(.dark
            )
    }
}
