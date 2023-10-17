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
}

struct ChangeBackgroundIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Toggle Task Stage"
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        
        BackgroudDataModel.shared.updateCurrentImage()
        
        return .result()
    }
}

struct BackgroundModel: Identifiable {
    var id = UUID().uuidString
    var image: UIImage
}

class BackgroudDataModel {
    
    static let shared = BackgroudDataModel()
    
    var images: [BackgroundModel] = []
    var image: BackgroundModel = BackgroundModel(image: UIImage(named: "luffy")!)
    private var currentIndex = 0
    
    func updateCurrentImage() {
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
