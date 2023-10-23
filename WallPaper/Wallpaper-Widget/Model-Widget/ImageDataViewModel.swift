//
//  ImageDataModel.swift
//  WallPaper
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI

struct ImageDataViewModel {
    
    static var shared = ImageDataViewModel()
    
    var model: WidgetModel = WidgetModel(type: .backgroud, images: [], name: "")
    var dateCheckList: [WeekendDayModel] = [.init(day: .monday), .init(day: .tuesday), .init(day: .thursday),
                                            .init(day: .wednesday), .init(day: .friday),
                                            .init(day: .saturday), .init(day: .sunday)]
    var currentIndex = 0
    var images: [UIImage] = []
    
    var widgetType: WDFolderType {
        return model.type
    }
    
    mutating func updateCurrentIndex() {
        if images.count == 0 { return }
        
        print("DEBUG: \(images.count)")
        if currentIndex < images.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }
    
    var currentImage: UIImage {
        print("DEBUG: currentImage \(currentIndex)")
        if self.currentIndex >= images.count  {
            return self.images.count == 0 ? UIImage(named: AssetConstant.imagePlacehodel)! : images[0]
        }
        return self.images.count == 0 ? UIImage(named: AssetConstant.imagePlacehodel)! : images[currentIndex]
    }

    
}
