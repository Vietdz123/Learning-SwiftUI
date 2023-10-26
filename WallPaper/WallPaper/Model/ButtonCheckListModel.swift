//
//  ButtonCheckListModel.swift
//  WallPaper
//
//  Created by MAC on 25/10/2023.
//

import UIKit

enum ButtonCheck: String, CaseIterable {
    case checked
    case uncheck
    
    var nameId: String {
        switch self {
        case .checked:
            return "Checked"
        case .uncheck:
            return "UnCheck"
        }
    }
    
    static func getType(name: String) -> ButtonCheck {
        
        for buttonType in ButtonCheck.allCases {
            if buttonType.nameId == name {
                return buttonType
            }
        }
        
        return .uncheck
    }
}

struct ButtonCheckListModel {
    
    var checkImage: [UIImage] = []
    var uncheckImage: [UIImage] = []
    
}
