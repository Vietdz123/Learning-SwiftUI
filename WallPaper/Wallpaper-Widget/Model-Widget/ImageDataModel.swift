//
//  ImageDataModel.swift
//  WallPaper
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI

struct ImageDataModel {
    
    static var shared = ImageDataModel()
    
    var images: [UIImage] = []
    var currentIndex = 0
    
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
        if shouldShowPlaceHolder { return UIImage(named: "bird")! }
        print("DEBUG: \(currentIndex)")
        if self.currentIndex >= images.count  {
            return self.images.count == 0 ? UIImage(named: Constant.imagePlacehodel)! : images[0]
        }
        return self.images.count == 0 ? UIImage(named: Constant.imagePlacehodel)! : images[currentIndex]
    }
    
    var shouldShowPlaceHolder = true
    
}
