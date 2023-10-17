//
//  FileService.swift
//  Learning-SwiftUI
//
//  Created by MAC on 17/10/2023.
//

import Foundation

import SwiftUI

class FileService {
    
    static let shared = FileService()
    
    var relativePath: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Image-Folder")
    }
    
    func writeToSource(with imageName: String) {
        let image = UIImage(named: imageName)
        
         try? FileManager.default.createDirectory(at: relativePath!, withIntermediateDirectories: false)
        
        guard let folder = relativePath?.appendingPathComponent("\(imageName).jpeg") else {return}
        
        FileManager.default.createFile(atPath: folder.pathExtension, contents: nil)
        print("DEBUG: \(relativePath)")
        if let data = image?.pngData() {
            try? data.write(to: folder.absoluteURL)
        }
    }
    
    func readAllImages() -> [UIImage] {
        let urls = try? FileManager.default.contentsOfDirectory(at: relativePath!, includingPropertiesForKeys: nil)
        
        var images: [UIImage] = []
        print("DEBUG: url123 \(urls?.count)")
        
        urls?.forEach({ url in
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {return}
            images.append(image)
            print("DEBUG: \(url)")
        })
        
        return images
    }
}
