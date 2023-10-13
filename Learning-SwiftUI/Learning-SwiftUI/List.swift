//
//  List.swift
//  Learning-SwiftUI
//
//  Created by Tiến Việt Trịnh on 13/10/2023.
//

import SwiftUI


struct ListView: View {
    var nameSections = ["Section A, Section B, Section C"]
    var nameItems = ["Vietdz", "Long Ot", "Duc Anh"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(nameSections, id: \.self) { section in
                   Section(section) {
                       ForEach(nameItems, id: \.self) { name in
                           Text(name)
                       }
                   }
               }
           }.navigationTitle("Menu")
        }

    }
}
