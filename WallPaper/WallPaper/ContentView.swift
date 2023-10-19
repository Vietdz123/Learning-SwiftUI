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
            
            ForEach(urlsImage, id: \.absoluteString) { url in
                AsyncImage(url: url.absoluteURL,
                                   content: { image in
                                       image.resizable()
                                            .aspectRatio(contentMode: .fill)
//                                            .frame(maxWidth: entry.size.width, maxHeight: entry.size.height)
                                   },
                                   placeholder: {
                                      
                                   }
                               )
            }
            Text("hello")
            
        }
        .padding()
        .onAppear {
            FileService.shared.writeToSource(with: "anya", with: "Anime")
            FileService.shared.writeToSource(with: "sasuke", with: "Anime")
            FileService.shared.writeToSource(with: "luffy", with: "Shippuden")
            FileService.shared.writeToSource(with: "placeHodel", with: "Shippuden")
//            FileService.shared.writeToSource(with: "anya")
//            FileService.shared.writeToSource(with: "luffy")
//            FileService.shared.writeToSource(with: "sasuke")
//            FileService.shared.writeToSource(with: "sakura")
//            FileService.shared.writeToSource(with: "sanji")
//            FileService.shared.writeToSource(with: "placeHodel")
            
        }
    }
}
