//
//  ContentView.swift
//  Demo-Widget
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            FileService.shared.writeToSource(with: "anya")
            FileService.shared.writeToSource(with: "luffy")
            FileService.shared.writeToSource(with: "sasuke")
            FileService.shared.writeToSource(with: "sakura")
            FileService.shared.writeToSource(with: "sanji")
            FileService.shared.writeToSource(with: "placeHodel")
        }
    }
}

#Preview {
    ContentView()
}
