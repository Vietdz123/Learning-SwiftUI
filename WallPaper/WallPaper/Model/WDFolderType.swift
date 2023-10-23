//
//  WDFolderType.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import Foundation

enum WDFolderType: Int, CaseIterable {
    
    case backgroud
    case checkList
    case placeholder
    
    var nameId: String {
        switch self {
        case .backgroud:
            return "Background"
        case .checkList:
            return "CheckList"
        case .placeholder:
            return "placeholder"
        }
    }
    
    static func getType(name: String) -> WDFolderType {
        
        for folderType in WDFolderType.allCases {
            if folderType.nameId == name {
                return folderType
            }
        }
        
        return .backgroud
        
    }
}
