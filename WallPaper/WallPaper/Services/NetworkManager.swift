//
//  NetworkManager.swift
//  WallPaper
//
//  Created by MAC on 26/10/2023.
//

import SwiftUI

enum WDNetworkManagerConstant {
    
    static let sheme = "https"
    static let host = "widget.eztechglobal.com"
    static let pathV1 = "/api/v1/widgets"
    static let query = "category+id,name-apps+id,name-tags+id,name"
    
}

class WDNetworkManager {
    
    static let shared = WDNetworkManager()
    
    func requestApi(completion: @escaping ((Bool) -> Void)) {
        
        guard let url = constructRequest() else { completion(false); return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                completion(false);
                return
            }
            
            guard let data = data else { completion(false); return }
            
            
            do {
                let response = try JSONDecoder().decode(EztWidgetResponse.self, from: data)
            
                response.data.data.forEach { ezWidget in
                    self.downloadFile(data: ezWidget) {
                        
                    }
                }
                
                
                
                

            } catch {
                DispatchQueue.main.async { completion(false) }
            }
        }.resume()

    }
    
    
    private func downloadFile(data: EztWidget, completion: @escaping(() -> Void)) {
        
        let folderType = WDFolderType.getType(name: data.category.name)
        
        data.path.forEach { path in
            
            let familyType = FamilyFolderType.getType(name: path.key_type)
            guard let url = URL(string: path.url.full) else { completion(); return}
            let urlRequest = URLRequest(url: url)

            URLSession.shared.downloadTask(with: urlRequest) { urlResponse, _, error in
                if let _ = error { completion(); return }
                
                guard let urlResponse = urlResponse else { completion(); return }
                
                FileService.shared.writeToSource(with: "\(folderType.nameId) \(data.id)",
                                                 with: urlResponse,
                                                 with: path.file_name,
                                                 widgetType: folderType,
                                                 familySize: familyType)
            }.resume()
        }
        
    }
    
    
    func constructRequest() -> URL? {
        
        var components = URLComponents()
        components.scheme = WDNetworkManagerConstant.sheme
        components.host = WDNetworkManagerConstant.host
        components.path = WDNetworkManagerConstant.pathV1
        components.queryItems = [
            URLQueryItem(name: "with", value: WDNetworkManagerConstant.query),
        ]
        
        return components.url
    }
    
    
}
