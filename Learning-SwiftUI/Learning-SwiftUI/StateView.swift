//
//  StateController.swift
//  Learning-SwiftUI
//
//  Created by Tiến Việt Trịnh on 14/10/2023.
//

import SwiftUI

class NetworkManager: ObservableObject {
    @Published var name: String = "Siuuu"
}

struct SomethingView: View {
    @ObservedObject var viewModel: NetworkManager
    
    var body: some View {
        Button {
            viewModel.name += "123"
        } label: {
            Text("Siuuuuuu")
        }
    }
}

struct ObservView: View {
    @StateObject var viewModel = NetworkManager()
    
    var body: some View {
        VStack(spacing: 30) {
            SomethingView(viewModel: viewModel)
            Text(viewModel.name)
        }
        

        
    }
}
