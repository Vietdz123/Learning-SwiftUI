//
//  ContentView.swift
//  HandleTapGestureWidgets
//
//  Created by MAC on 17/10/2023.
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
        .onAppear(perform: {
            FileService.shared.writeToSource(with: "luffy1")
            FileService.shared.writeToSource(with: "luffy")
        })
    }
}

#Preview {
    ContentView()
}


