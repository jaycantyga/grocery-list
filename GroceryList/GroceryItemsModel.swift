//
//  GroceryItemsModel.swift
//  GroceryList
//
//  Created by jay on 11/14/16.
//  Copyright © 2016 jay. All rights reserved.
//

import Foundation

class GroceryItemsModel {
    
    static let shared = GroceryItemsModel()
    
    var inventoryList: [[String: Any]] = [
        [
            "name": "Bannana",
            "imageName": "banana.jpg",
            "quantity": 5,
            "cartCount": 0
        ],
        [
            "name": "Apple",
            "imageName": "banana.jpg",
            "quantity": 5,
            "cartCount": 0
        ],
        [
            "name": "Guava",
            "imageName": "banana.jpg",
            "quantity": 4,
            "cartCount": 0
        ],
        [
            "name": "Kiwi",
            "imageName": "banana.jpg",
            "quantity": 3,
            "cartCount": 0
        ]
    ]
    
    func getItemsForCart() -> [[String: Any]] {
        
        var result = [[String: Any]]()
        
        for item in inventoryList {
            if item["cartCount"] as! Int > 0 {
                result.append(item)
            }
        }
        
        return result
    }
}
