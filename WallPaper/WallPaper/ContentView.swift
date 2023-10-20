//
//  ContentView.swift
//  WallPaper
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var urlsImage: [URL] = []
    var body: some View {
        VStack {
            
            Rectangle()
                .fill(.blue)
                .frame(width: 50)
                .frame(height: 100)
            
        }
        .padding()
        .onAppear {
//            FileService.shared.writeToSource(with: "anya", with: "Anime")
//            FileService.shared.writeToSource(with: "sasuke", with: "Anime")
//            FileService.shared.writeToSource(with: "luffy", with: "Shippuden")
//            FileService.shared.writeToSource(with: "placeHodel", with: "Shippuden")
            
        }
    }
}

