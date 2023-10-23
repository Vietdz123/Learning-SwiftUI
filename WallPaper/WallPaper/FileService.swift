//
//  FileService.swift
//  WallPaper
//
//  Created by MAC on 19/10/2023.
//

import SwiftUI



class FileService {
    
    static let shared = FileService()
    
    static func relativePath(with nameFolder: String) -> URL? {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: AppConstant.groupConstant)?.appendingPathComponent("Image-Folder").appendingPathComponent(nameFolder)
    }
    
     var relativePath: URL? {
         return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: AppConstant.groupConstant)?.appendingPathComponent("Image-Folder")
    }
    
     private func getAllFolder() -> [String] {
        guard let folder = relativePath else {return []}
         guard let urls = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil) else {return []}

         return urls.filter({ url in
             return !url.absoluteString.contains(".")
         }).map { url in
            return url.deletingPathExtension().lastPathComponent
        }
    }
    
    func getFolderModels() -> [FolderModel] {
        
        let nameFolders = FileService.shared.getAllFolder()
        var folders: [FolderModel] = []
        
        nameFolders.forEach { name in
            let components = name.split(separator: "-")
            if components.count >= 2 {
                let noIdName = String(components[1])
                
                let type = WDFolderType.getType(name: noIdName)
                let folder = FolderModel(name: name, actualName: noIdName, type: type)
                folders.append(folder)
            }
        }
        
        return folders
    }
    
    func writeToSource(with nameFolder : String, with imageName: String, widgetType: WDFolderType = .backgroud) {
        let image = UIImage(named: imageName)
        
        if !FileManager.default.fileExists(atPath: FileService.shared.relativePath?.path ?? "") {
            try? FileManager.default.createDirectory(at: FileService.shared.relativePath!, withIntermediateDirectories: false)
        }
        
        if !FileManager.default.fileExists(atPath: FileService.relativePath(with: nameFolder)?.path ?? "") {
            try? FileManager.default.createDirectory(at: FileService.relativePath(with: "\(widgetType.nameId)-\(nameFolder)")!, withIntermediateDirectories: false)
        }
        
        guard let folder = FileService.relativePath(with: "\(widgetType.nameId)-\(nameFolder)")?.appendingPathComponent("\(imageName).jpeg") else {return}

        FileManager.default.createFile(atPath: folder.lastPathComponent, contents: nil)
        
        print("DEBUG: \(folder.absoluteString) and \(folder.lastPathComponent)")
        if let data = image?.pngData() {
            do {
                try data.write(to: folder.absoluteURL)
            } catch {
                print("DEBUG: \(error.localizedDescription)")
            }
            
        }
    }
    
    func readAllImages(from nameFolder: String) -> [UIImage] {
        guard let folder = FileService.relativePath(with: nameFolder) else {return []}
        guard var urls = try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: [.creationDateKey]) else {
            return []
        }
        
        urls = urls.sorted(by: {
            if let date1 = try? $0.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate,
               let date2 = try? $1.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate {
                return date1 < date2
            }
            return false
        })
        
        var images: [UIImage] = []
    
        urls.forEach({ url in
            print("DEBUG: \(url)")
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {return}
            images.append(image)
        })
        
        return images
    }
    
}
