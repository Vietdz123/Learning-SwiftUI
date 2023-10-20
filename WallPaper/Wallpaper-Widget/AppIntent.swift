//
//  AppIntent.swift
//  Wallpaper-Widget
//
//  Created by MAC on 19/10/2023.
//

import WidgetKit
import AppIntents
import SwiftUI

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Pick a image")
    var imageSrc: ImageSource
    
    func perform() async throws -> some IntentResult {
            
        ImageDataModel.shared.updateCurrentIndex() 
        
        return .result()
    }
}



struct ImageSource: AppEntity {
    
    var id: String
    
    static var defaultQuery: ImageQuery = ImageQuery()   //EntityQuery
        
    var name: String
    var images: [UIImage] {
        FileService.shared.readAllImages(from: self.name)
    }
    
    static func getAllSource() -> [ImageSource] {
        return FileService.shared.getAllFolder().map { name in
            return ImageSource(id: name, name: name)
        }
    }
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Image Viet"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id)")
    }
}

struct ImageQuery: EntityQuery {
    
    func entities(for identifiers: [ImageSource.ID]) async throws -> [ImageSource] {
//        return ImageSource.getAllSource().filter { imageModel in
//            return identifiers.contains(imageModel.id)
//        }
        
//        return ImageSource.getAllSource()
        return []
    }	
    
    func suggestedEntities() async throws -> [ImageSource] {
        return ImageSource.getAllSource()
    }
    
    func defaultResult() async -> ImageSource? {
        try? await suggestedEntities().first
    }
}

