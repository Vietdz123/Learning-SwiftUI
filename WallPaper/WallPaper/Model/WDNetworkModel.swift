//
//  WDNetworkModel.swift
//  WallPaper
//
//  Created by MAC on 26/10/2023.
//

import SwiftUI


import SwiftUI

struct EztWidgetResponse: Codable {
    let data: WidgetData
}

struct WidgetData: Codable {
    let data: [EztWidget]
}

struct EztWidget: Codable {
    let id: Int
    let thumbnail: [Thumbnail]
    let path: [WidgetPath]
    let category_id: Int
    let is_trend: Int
    let is_private: Int
    let order: Int
    let active: Int
    let download: Int
    let rating: Int
    let daily_rating: Int
    let favorite: Int
    let cost: Int
    let license: String
    let updated_at: String
    let created_at: String
    let category: CategoryWidget
    let apps: [EztApp]
    let tags: [String]
}

struct Thumbnail: Codable {
    let file_name: String
    let key_type: String
    let type_file: String
    let url: PathURL
}

struct WidgetPath: Codable {
    let file_name: String
    let key_type: String
    let type_file: String
    let url: PathURL
}

struct PathURL: Codable {
    let full: String
    let preview: String
    let small: String
    let extra_small: String
}

struct CategoryWidget: Codable {
    let id: Int
    let name: String
}

struct EztApp: Codable {
    let id: Int
    let name: String
   
}


//
//// MARK: - Welcome
//struct WDNetworkModel: Decodable {
//    let data: WDDataNetwork
//}
//
//// MARK: - DataClass
//struct WDDataNetwork: Decodable {
//    let current_page: Int?
//    let data: [WDData]?
//    let first_page_url: String?
//    let from: Int?
//    let next_page_url: String?
//    let path: String?
//    let per_page: Int?
//    let prev_page_url: String?
//    let to: Int?
//}
//
//// MARK: - Datum
//struct WDData: Decodable {
//    let id: Int?
//    let thumbnail, path: [WDPath]?
//    let category_id, is_trend, is_private, order: Int?
//    let active, download, rating, daily_rating: Int?
//    let favorite, cost: Int?
//    let category: WDCategory?
//    let apps: [WDApp]?
//}
//
//// MARK: - App
//struct WDApp: Decodable {
//    let id: Int?
//    let name: String?
//}
//
//// MARK: - Category
//struct WDCategory: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - Path
//struct WDPath: Decodable {
//    let file_name, key_type, type_file: String?
//    let url: WDURLClass?
//}
//
//// MARK: - URLClass
//struct WDURLClass: Decodable {
//    let full, preview, small, extra_small: String?
//}
//
//
