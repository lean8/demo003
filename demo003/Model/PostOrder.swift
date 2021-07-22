//
//  PostOrder.swift
//  demo003
//
//  Created by lean on 2021/7/15.
//

import Foundation

struct PostOrder: Encodable {
    var data: OrderItem
}

struct OrderItem: Encodable {
    let group: String
    let orderer: String
    let drinkName: String
    let drinkSize: String
    let drinkTemp: String
    let drinkSugar: String
    let addOn: String
    let saySomething: String
    let totalPrice: String
    let editCode: String
    let lastUpdateTime: String
}
