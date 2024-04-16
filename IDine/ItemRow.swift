//
//  itemRow.swift
//  IDine
//
//  Created by Robinson Thairu on 17/04/2024.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    
    let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
    
    var body: some View {
        VStack {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.gray, lineWidth: 2))
                    .shadow(radius: 2)
                
                VStack(alignment: .leading) {
            
                        Text(item.name)
                            .font(.headline)
               
                    
                    Text("$\(item.price)")
                        .foregroundStyle(.secondary)
                        .fontDesign(.serif)
                }
                
                Spacer()
                
                ForEach(item.restrictions, id:\.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                }
            }
        }
        
    }
}

#Preview {
    ItemRow(item:MenuItem.example)
}
