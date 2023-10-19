//
//  AppIntent.swift
//  WallpaperWidget
//
//  Created by MAC on 19/10/2023.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Pick a image")
    var imageSrc: ImageSource
}



struct ImageSource: AppEntity {
    
    var id: String
    
    static var defaultQuery: ImageQuery = ImageQuery()   //EntityQuery
        
    var imageUrl: URL
    
    static func getAllSource() -> [ImageSource] {
        return FileService.shared.readAllImageUrls().map { url in
            return ImageSource(id: url.lastPathComponent, imageUrl: url)
        }.filter { imgSrc in
            return imgSrc.id != "placeHodel"
        }
    }
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Image Viet"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id)")
    }
}

struct ImageQuery: EntityQuery {
    
    func entities(for identifiers: [ImageSource.ID]) async throws -> [ImageSource] {
        return ImageSource.getAllSource().filter { imageModel in
            return identifiers.contains(imageModel.id)
        }
        
    }
    
    func suggestedEntities() async throws -> [ImageSource] {
        return ImageSource.getAllSource()
    }
    
    func defaultResult() async -> ImageSource? {
        try? await suggestedEntities().first
    }
}

struct ChangeImageIntent: AppIntent {
    
    static var title: LocalizedStringResource = "ChangeImageIntent"
    
    
    func perform() async throws -> some IntentResult {
            
            return .result()
        }
}

