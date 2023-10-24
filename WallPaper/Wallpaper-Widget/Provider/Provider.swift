//
//  Provider.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import SwiftUI
import WidgetKit

struct Provider: AppIntentTimelineProvider {
    
    
    func placeholder(in context: Context) -> SourceImageEntry {
        print("DEBUG: goto placeholder")
        return SourceImageEntry(image: UIImage(named: AssetConstant.imagePlacehodel)!, size: context.displaySize, type: .placeholder, intent: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SourceImageEntry {
        print("DEBUG: goto snapshot")
        return SourceImageEntry(image: UIImage(named: AssetConstant.imagePlacehodel)!, size: context.displaySize, type: .placeholder, intent: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SourceImageEntry> {
        
        print("DEBUG: goto timeline and \(configuration.imageSrc.folderModel.type)")

        switch context.family {
        case .systemSmall:
            ImageDataViewModel.shared.images = configuration.imageSrc.getImages(family: .small)
        case .systemMedium:
            ImageDataViewModel.shared.images = configuration.imageSrc.getImages(family: .medium)
        default:
            ImageDataViewModel.shared.images = []
        }
        
        let image = ImageDataViewModel.shared.currentImage
        let type = configuration.imageSrc.folderModel.type
        print("DEBUG: \(type) type")
        let size = context.displaySize

        let entry = SourceImageEntry(image: image, size: size, type: type, intent: configuration)
        
        return Timeline(entries: [entry], policy: .never)
    }
}
