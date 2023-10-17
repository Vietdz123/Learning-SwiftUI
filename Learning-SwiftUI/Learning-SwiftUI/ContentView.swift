//
//  ContentView.swift
//  Learning-SwiftUI
//
//  Created by Tiến Việt Trịnh on 12/10/2023.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
        Text("SwiftUI - \nViews and Controls")
        .font(.system(size: 24, weight: .bold, design: .serif))
        .italic()   //In nghiêng
        .opacity(0.5)
        .lineLimit(2)
        .multilineTextAlignment(.center)
        .foregroundColor(.red)
        Text("SwiftUI") + Text(" ") + Text ("Views and Controls")
    }
}

struct ContentView: View {
    @State var tName : String = "SwiftUI - TextField"
    var body: some View {
        Text("Hello")
            .onAppear(perform: {
            FileService.shared.writeToSource(with: "luffy1")
            FileService.shared.writeToSource(with: "luffy")
        })
        
    }
}

struct ButtonView: View {
    var body: some View {
        Button {
            print("Siuuuuu")
        } label: {
            Text("Quần què")
        }
        
        Button {
            print("Do something")
        } label: {
            Image("naruto")
                .resizable()
                .aspectRatio(contentMode: .fill) //fill image with button
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(75)
                .overlay {
                    RoundedRectangle(cornerRadius: 75)
                                  .stroke(Color.red, lineWidth: 6)
                }
        }
        .frame(width: 150, height: 150)
        .cornerRadius(25)
        .background(.purple)
    }
}

struct ImageView: View {
    var body: some View {
        Image("naruto")
            .resizable()
            .aspectRatio(contentMode: .fit)
//            .frame(width: 200, height: 200)
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 400, height: 400)
//            .background(.orange)
//            .scaleEffect(2)
            .border(.blue, width: 5)

            
//        Image("naruto")
//               .resizable()
//               .aspectRatio(contentMode: .fit) // .scaledToFit()
//               .frame(width: 200, height: 200)
//               .border(Color.red, width: 3)
    }
}

struct SecurityFiled: View {
    @State var tName : String = ""
    var body: some View {
        
        SecureField("Enter a Password", text: $tName)
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
}}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
