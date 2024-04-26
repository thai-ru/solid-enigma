//
//  ContentView.swift
//  IDine
//
//  Created by Robinson Thairu on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        
            NavigationStack {
                List {
                    ForEach(menu){ section in
                        Section(section.name){
//                            Text(section.name)
//                                .font(.title3)
//                                .foregroundStyle(.secondary)
                            ForEach(section.items) { item in
                                NavigationLink(value: item) {
                                    ItemRow(item: item)
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: MenuItem.self){ item in
                    ItemDetail(item: item)
                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
        }
    }

#Preview {
    ContentView()
}
