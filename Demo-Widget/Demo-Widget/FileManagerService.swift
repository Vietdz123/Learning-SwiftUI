//
//  FileManagerService.swift
//  Demo-Widget
//
//  Created by MAC on 19/10/2023.
//
import SwiftUI

class FileService {
    
    static let shared = FileService()
    
    var relativePath: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Image-Folder")
    }
    
    func writeToSource(with imageName: String) {
        let image = UIImage(named: imageName)
        
        print("DEBUG: haha")
        if !FileManager.default.fileExists(atPath: relativePath?.path ?? "") {
            try? FileManager.default.createDirectory(at: relativePath!, withIntermediateDirectories: false)
        }
        guard let folder = relativePath?.appendingPathComponent("\(imageName).jpeg") else {return}

        FileManager.default.createFile(atPath: folder.pathExtension, contents: nil)
        
        print("DEBUG: \(folder.absoluteString)")
        if let data = image?.pngData() {
            try? data.write(to: folder.absoluteURL)
        }
    }
    
    func readAllImages() -> [UIImage] {
        let urls = try? FileManager.default.contentsOfDirectory(at: relativePath!, includingPropertiesForKeys: nil)
        
        var images: [UIImage] = []
        
        
        urls?.forEach({ url in
            print("DEBUG: \(url)")
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {return}
            images.append(image)
        })
        
        return images
    }
    
    func readAllImageStrings() -> [String] {
        let urls = try? FileManager.default.contentsOfDirectory(at: relativePath!, includingPropertiesForKeys: nil)
        
        return urls?.map { url in
            url.absoluteString
        } ?? []

    }
    
    func readAllImageUrls() -> [URL] {
//        print("DEBUG: \(relativePath?.absoluteString)")
//        guard let urls = try? FileManager.default.contentsOfDirectory(at: relativePath!, includingPropertiesForKeys: nil) else {
//            return []
//        }
//        
//        print("DEBUG: \(urls.count)")
//        urls.forEach { url in
//            print("DEBUG: \(url.absoluteURL) and \(urls.count)")
//        }
//        return urls
        
        
        do {
            let urls = try FileManager.default.contentsOfDirectory(at: relativePath!, includingPropertiesForKeys: [.creationDateKey])

                    urls.forEach { url in
                        print("DEBUG: \(url.absoluteURL) and \(urls.count)")
                    }
            
            return urls
        } catch {
            return []
           
        }
    }
}
