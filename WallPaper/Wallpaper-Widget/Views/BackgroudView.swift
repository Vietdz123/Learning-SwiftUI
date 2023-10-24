//
//  BackgroudView.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import SwiftUI
import WidgetKit
import AppIntents

struct BackgroudView: View {
    
    var image: UIImage
    var size: CGSize
    
    var body: some View {
        ZStack {
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(maxWidth: size.width, maxHeight: size.height)
                .ignoresSafeArea()
            
            
            Button(intent: ConfigurationAppIntent()) {
                Text("")
                    .frame(maxWidth: size.width, maxHeight: size.height)
                    .background(Color.clear)
                
            }
            .buttonStyle(.plain)
            
        }
    }
}

