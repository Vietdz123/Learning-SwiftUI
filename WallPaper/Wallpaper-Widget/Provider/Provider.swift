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
        return SourceImageEntry(image: UIImage(named: AssetConstant.imagePlacehodel)!, size: context.displaySize, type: .placeholder, btnChecklistModel: ButtonCheckListModel())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SourceImageEntry {
        print("DEBUG: goto snapshot")
        return SourceImageEntry(image: UIImage(named: AssetConstant.imagePlacehodel)!, size: context.displaySize, type: .placeholder, btnChecklistModel: ButtonCheckListModel())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SourceImageEntry> {
        
        print("DEBUG: goto timeline and \(configuration.imageSrc.folderModel.type)")

        switch context.family {
        case .systemSmall, .systemLarge:
            ImageDataViewModel.shared.images = configuration.imageSrc.getImages(family: .square)
        case .systemMedium:
            ImageDataViewModel.shared.images = configuration.imageSrc.getImages(family: .rectangle)
        default:
            ImageDataViewModel.shared.images = []
        }
                
        let image = ImageDataViewModel.shared.currentImage
        let type = configuration.imageSrc.folderModel.type
        let size = context.displaySize
        let btnCLModel = configuration.imageSrc.getButtonChecklistModel()
        
        let entry = SourceImageEntry(image: image, size: size, type: type, btnChecklistModel: btnCLModel)
        
        return Timeline(entries: [entry], policy: .never)
    }
}
