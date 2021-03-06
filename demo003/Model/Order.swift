//
//  Order.swift
//  demo003
//
//  Created by lean on 2021/7/13.
//

import Foundation

class Order {
    var drinkName: String?
    var drinkTemp: Temp?
    var drinkSugar: Sugar?
    var drinkSize: Size?
    var addOn: Array<AddOn> = []
    var saySomething: String = "想說點什麼呢..."
    var totalPrice: Int?
    
    init(drinkName: String?,
         drinkTemp: Temp?,
         drinkSugar: Sugar?,
         drinkSize: Size?,
         totalPrice: Int?) {
        self.drinkName = drinkName
        self.drinkTemp = drinkTemp
        self.drinkSugar = drinkSugar
        self.drinkSize = drinkSize
        self.totalPrice = totalPrice
    }
    
    func reset() {
        drinkName = nil
        drinkTemp = nil
        drinkSugar = nil
        drinkSize = nil
        addOn = []
        saySomething = "想說點什麼呢..."
        totalPrice = nil
    }
}
