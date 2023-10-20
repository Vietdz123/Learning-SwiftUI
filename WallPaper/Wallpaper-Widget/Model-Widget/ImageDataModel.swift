//
//  ImageDataModel.swift
//  WallPaper
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI

struct ImageDataModel {
    
    static var shared = ImageDataModel(images: [])
    
    var images: [UIImage]
    var currentIndex = 0
    
    init(images: [UIImage], currentIndex: Int = 0) {
        self.images = images
        self.currentIndex = currentIndex
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
        print("DEBUG: \(currentIndex)")
        if self.currentIndex >= images.count  {
            return self.images.count == 0 ? UIImage(named: Constant.imagePlacehodel)! : images[0]
        }
        return self.images.count == 0 ? UIImage(named: Constant.imagePlacehodel)! : images[currentIndex]
    }
    

    
}
