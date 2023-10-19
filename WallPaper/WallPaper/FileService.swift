//
//  FileService.swift
//  WallPaper
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI

struct Constant {
    static let groupConstant = "group.demo.WallPaper"
}

class FileService {
    
    static let shared = FileService()
    
    static func relativePath(with nameFolder: String) -> URL? {
//        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Image-Folder")
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constant.groupConstant)?.appendingPathComponent(nameFolder)
    }
    
    static var relativePath: URL? {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constant.groupConstant)
    }
    
    static func getAllFolder() -> [String] {
        guard let folder = FileService.relativePath else {return []}
        guard let urls = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil) else {return []}
        
        return urls.map { url in
            return url.absoluteString
        }
    }
    
    func writeToSource(with imageName: String, with nameFolder: String) {
        let image = UIImage(named: imageName)
        
        if !FileManager.default.fileExists(atPath: FileService.relativePath(with: nameFolder)?.path ?? "") {
            try? FileManager.default.createDirectory(at: FileService.relativePath(with: nameFolder)!, withIntermediateDirectories: false)
        }
        guard let folder = FileService.relativePath(with: nameFolder)?.appendingPathComponent(nameFolder).appendingPathComponent("\(imageName).jpeg") else {return}

        FileManager.default.createFile(atPath: folder.pathExtension, contents: nil)
        
        print("DEBUG: \(folder.absoluteString)")
        if let data = image?.pngData() {
            try? data.write(to: folder.absoluteURL)
        }
    }
    
    func readAllImages(from nameFolder: String) -> [UIImage] {
        guard let folder = FileService.relativePath(with: nameFolder)?.appendingPathComponent(nameFolder) else {return []}
        let urls = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil)
        
        var images: [UIImage] = []
    
        urls?.forEach({ url in
            print("DEBUG: \(url)")
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {return}
            images.append(image)
        })
        
        return images
    }
    
    func readAllImageStrings(from nameFolder: String) -> [String] {
        guard let folder = FileService.relativePath(with: nameFolder)?.appendingPathComponent(nameFolder) else {return []}
        let urls = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil)
        
        return urls?.map { url in
            url.absoluteString
        } ?? []

    }
        
    func readAllImageUrls(from nameFolder: String) -> [URL] {
        guard let folder = FileService.relativePath(with: nameFolder)?.appendingPathComponent(nameFolder) else {return []}
        guard var urls = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys:  [.creationDateKey]) else {
            return []
        }
        
        urls = urls.sorted(by: {
            if let date1 = try? $0.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate,
               let date2 = try? $1.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate {
                return date1 > date2
            }
            return false
        })


        
        print("DEBUG: \(urls.count)")
        urls.forEach { url in
            print("DEBUG: \(url.absoluteURL) and \(urls.count)")
        }
        return urls
    }
}
