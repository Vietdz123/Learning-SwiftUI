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
            
        imageSrc = ImageSource(id: "anya", image: UIImage(named: "placeHodel")!)
        
        return .result()
    }
}


struct ImageSource: AppEntity {
    
    var id: String
    
    static var defaultQuery: ImageQuery = ImageQuery()   //EntityQuery
        
    var image: UIImage
    
    static func getAllSource() -> [ImageSource] {
        return FileService.shared.readAllImageUrls().map { url in
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data ?? Data()) ?? UIImage(named: "placeHodel")!
            return ImageSource(id: url.deletingPathExtension().lastPathComponent, image: image)
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

