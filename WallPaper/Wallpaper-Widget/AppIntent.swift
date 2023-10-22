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
    
//    @Parameter(title: "Pick a image")
//    var cac: String

    
    func perform() async throws -> some IntentResult {
        
        print("DEBUG: goto perform")
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
    
    static func getAllData() -> [ImageSource] {
       var a =  FileService.shared.getAllFolder().map { name in
            return ImageSource(id: name, name: name)
        }
        
        a.append(ImageSource(id: "chose", name: "bird"))
        return a
    }
    
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Image Viet"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id)")
    }
}

struct ImageQuery: EntityStringQuery {
    func entities(matching string: String) async throws -> [ImageSource] {
        print("DEBUG: goto matching \(string)")
        return [ImageSource(id: "bird", name: "bird")]
        return ImageSource.getAllSource()
    }
    
    
    func entities(for identifiers: [ImageSource.ID]) async throws -> [ImageSource] {
//        return ImageSource.getAllSource().filter { imageModel in
//            return identifiers.contains(imageModel.id)
//        }
        
        
        print("DEBUG: goto entities \(String(describing: identifiers.first))")
//        return [ImageSource(id: "bird", name: "bird")]
        var a = ImageSource.getAllData()
        return a
//        return []
    }	
    
    func suggestedEntities() async throws -> [ImageSource] {
        print("DEBUG: goto suggestedEntities")
        
        return ImageSource.getAllSource()
    }
    
    func defaultResult() async -> ImageSource? {
        print("DEBUG: goto defaultResult")
//        return try? await suggestedEntities().first
       return ImageSource(id: "chose", name: "fgdsajkhfgskdjh")
    }
}

