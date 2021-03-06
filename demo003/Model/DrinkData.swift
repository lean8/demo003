//
//  DrinkData.swift
//  demo003
//
//  Created by lean on 2021/7/13.
//

import Foundation

struct SheetStruct: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let entry: Array<DrinkData>
}

struct DrinkData: Codable {
    let name_zh: StringType
    let name_en: StringType
    let description: StringType
    let imageUrl: StringType
    let priceM: StringType
    let maxCalorieM: StringType
    let priceL: StringType
    let maxCalorieL: StringType
    let isCanAddWhiteBubble: StringType
    let isCanAddBlackBubble: StringType
    let isSugarFixed: StringType
    
    enum CodingKeys: String, CodingKey {
        case name_zh = "gsx$namezh"
        case name_en = "gsx$nameen"
        case description = "gsx$description"
        case imageUrl = "gsx$imageurl"
        case priceM = "gsx$pricem"
        case maxCalorieM = "gsx$maxcaloriem"
        case priceL = "gsx$pricel"
        case maxCalorieL = "gsx$maxcaloriel"
        case isCanAddWhiteBubble = "gsx$iscanaddwhitebubble"
        case isCanAddBlackBubble = "gsx$iscanaddblackbubble"
        case isSugarFixed = "gsx$issugarfixed"
    }
}

struct StringType: Codable {
    let value: String
    enum CodingKeys: String, CodingKey {
        case value = "$t"
    }
}
