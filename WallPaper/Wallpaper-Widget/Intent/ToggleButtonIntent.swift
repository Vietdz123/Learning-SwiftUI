//
//  ToggleButtonIntent.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import SwiftUI
import WidgetKit
import AppIntents

struct ToggleButtonIntent: AppIntent {

    init() {
        
    }
    
    static var title: LocalizedStringResource = "ButtonAppIntent"
    
    @Parameter(title: "Task ID")
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        print("DEBUG: goto perform button")
        ImageDataViewModel.shared.dateCheckList[id].isChecked.toggle()
        
        return .result()
    }
    
}
