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

    @Parameter(title: "Pick a image")
    var imageSrc: ImageSource
    
    func perform() async throws -> some IntentResult {
        
        print("DEBUG: goto perform")
        ImageDataViewModel.shared.updateCurrentIndex()
        
        return .result()
    }
}




struct ImageSource: AppEntity {
    
    var id: String
    
    static var defaultValue: ImageSource {
        return ImageSource(id: "choose", folderModel: FolderModel(name: "placeHolder", actualName: "placeHolder", type: .backgroud))
    }
    
    static var defaultQuery: ImageQuery = ImageQuery()   //EntityQuery
        
    var folderModel: FolderModel
    
    var images: [UIImage] {
        FileService.shared.readAllImages(from: self.folderModel.name)
    }
    
    static func getSuggested() -> [ImageSource] {
        return FileService.shared.getFolderModels().map { folder in
            return ImageSource(id: folder.actualName, folderModel: folder)
        }
    }
    
    static func getAllSource() -> [ImageSource] {
        var src = FileService.shared.getFolderModels().map { folder in
            return ImageSource(id: folder.actualName, folderModel: folder)
        }
        
        src.append(ImageSource.defaultValue)
        return src
    }
    
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Image Viet"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id)")
    }
}

struct ImageQuery: EntityStringQuery {
    func entities(matching string: String) async throws -> [ImageSource] {
        return ImageSource.getAllSource().filter { imgsrc in
            print("DEBUG: qqq \(imgsrc.id) and \(string)")
            return imgsrc.id == string
        }
    }
    
    
    func entities(for identifiers: [ImageSource.ID]) async throws -> [ImageSource] {
        print("DEBUG: goto entities")
        return ImageSource.getAllSource().filter { imgsrc in
            return identifiers.contains { id in
                print("DEBUG: \(imgsrc.id) and \(id)")
                return id == imgsrc.id
            }
        }
    }
    
    func suggestedEntities() async throws -> [ImageSource] {
        print("DEBUG: goto suggestedEntities")
        return ImageSource.getSuggested()
    }
    
    func defaultResult() async -> ImageSource? {
        print("DEBUG: goto defaultResult")
        return ImageSource.defaultValue
    }
}

