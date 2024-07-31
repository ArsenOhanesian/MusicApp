//
//  MusicCell.swift
//  MusicApp
//
//  Created by arsen on 31.07.2024.
//

import SwiftUI

struct MusicCell: View{
    // MARK: - Properties
    let name: String
    let author: String
    let time: String
    
    // MARK: - Body
    var body: some View{
        HStack{
            Color.white
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack (alignment: .leading){
                Text(name)
                    .nameFont()
                Text(author)
                    .artistFont()
            }
            
            Spacer()
            
            Text(time)
                .artistFont()
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct MusicCell_Previews: PreviewProvider {
    static var previews: some View {
        MusicCell(name: "Name", author: "Author", time: "Time")
    }
}
