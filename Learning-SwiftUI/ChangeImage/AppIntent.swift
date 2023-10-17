//
//  AppIntent.swift
//  ChangeImage
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import AppIntents
import SwiftUI

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    
    @Parameter(title: "Backgroud color", default: BgColor.blue)
    var backgroudColor: BgColor
}


struct ChangeBackgroundIntent: AppIntent {
    
    init() {
        
    }
    
    @Parameter(title: "Image ID")
    var id: String
    

    
    
    init(id: String) {
        self.id = id
    }
    
    static var title: LocalizedStringResource = "Toggle Task Stage"
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        

        return .result()
    }
}

enum BgColor: String, CaseIterable, AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "TypeDisplayRepresentation BgColor"
    
    static var caseDisplayRepresentations: [BgColor : DisplayRepresentation] = [
        .blue: "luffy",
        .green: "naruto",
        .red: "sasuke",
        .orange: "sakura"
    ]
    
    case blue = "luffy"
    case green = "naruto"
    case red = "sasuke"
    case orange = "sakura"
    
    var color: Image {
        print("DEBUG: \(self.rawValue) qqq")
        return Image(self.rawValue)
    }
}


struct BackgroundModel: Identifiable {
    var id = UUID().uuidString
    var image: UIImage
    var isLuffy: Bool = true
}

class BackgroudDataModel {
    
    static let shared = BackgroudDataModel()
    
    var images: [BackgroundModel] = []
    var image: BackgroundModel = BackgroundModel(image: UIImage(named: "luffy")!)
    private var currentIndex = 0
    
    func updateCurrentImage() {
        if images.isEmpty {
            image = BackgroundModel(image: UIImage(named: "luffy")!)
            return
        }
        
        if image.id == images.last?.id {
            image = images.first ?? BackgroundModel(image: UIImage(named: "luffy")!)
            currentIndex = 0
        } else {
            currentIndex += 1
            print("DEBUG: \(images.count)")
            image = images[currentIndex]
        }
    }
}
