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
        TextField("Placeholder", text: $tName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(50)
            .multilineTextAlignment(.center)
        ArticleView()
        SecurityFiled()
        ImageView()
    }
}

struct ImageView: View {
    var body: some View {
        Image("naruto")
            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 200, height: 200)
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .background(.red)
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
