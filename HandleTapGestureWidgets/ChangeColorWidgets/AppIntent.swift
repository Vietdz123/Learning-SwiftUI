//
//  AppIntent.swift
//  ChangeColorWidgets
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import AppIntents
import SwiftUI

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    
    static var title: LocalizedStringResource = "Configuration viet123"
    static var description = IntentDescription("This is an viet widget.")

    // An example configurable parameter.
    @Parameter(title: "Backgroud color", default: BgColor.blue)
    var backgroudColor: BgColor
    
    @Parameter(title: "Backgroud color", default: "Hello")
    var name: String
    
    @Parameter(title: "Backgroud Siuuuu", default: "qq")
    var siu: String
}

enum BgColor: String, CaseIterable, AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "TypeDisplayRepresentation BgColor"
    
    static var caseDisplayRepresentations: [BgColor : DisplayRepresentation] = [
        .blue: "Blue xanh",
        .green: "Green xanh lá",
        .red: "Red đỏ",
        .orange: "Cam orange"
    ]
    
    case blue
    case green
    case red
    case orange
    
    var color: Color {
        switch self {
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        }
    }
}
