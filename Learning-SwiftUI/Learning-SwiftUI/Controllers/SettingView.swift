//
//  SettingView.swift
//  Learning-SwiftUI
//
//  Created by Tiến Việt Trịnh on 13/10/2023.
//

import SwiftUI

enum AutoJoinHotspotOption: String, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case never
    case askToJoin
    case automatic
}

struct SettingView: View {
    @State private var nameDevice: String = ""
    @State private var isWifiEnabled: Bool = false
    @State private var joinType: AutoJoinHotspotOption = .askToJoin
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name Device", text: $nameDevice)
                    LabeledContent("IOS Version", value: "16.5")
                        .padding([.top, .trailing, .leading], 20)
                        .padding([.bottom], 30)
                    
                } header: {
                    Text("About").foregroundColor(.blue)
                }
                .background(.orange)
                
                Section {
                    Toggle("Wifi", isOn: $isWifiEnabled)
                    Picker("Auto say siuuu", selection: $joinType) {
                        ForEach(AutoJoinHotspotOption.allCases) { state in
                            Text(state.rawValue).foregroundColor(.red).background(.blue)
                        }
                    }.padding().background(.blue)
                } header: {
                    Text("Internet").foregroundColor(.red).background(.white)
                }
                .padding([.leading], -12)
                .background(.red)
                

            }.navigationBarTitle("isWifiOn")
            
        }
    }
}
