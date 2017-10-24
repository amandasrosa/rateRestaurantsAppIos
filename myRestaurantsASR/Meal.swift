//
//  Meal.swift
//  myRestaurantsASR
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    public private(set) var name: String
    public private(set) var image: UIImage!
    public private(set) var comment: String!
    public private(set) var ratePresentation: Int
    public private(set) var rateFlavor: Int
    public private(set) var ratePrice: Int
    public private(set) var rateTotal: Int
    
    init(name: String, image: UIImage!, comment: String!, presentation: Int, flavor: Int, price: Int, total: Int) {
        self.name = name
        self.image = image
        self.comment = comment
        self.ratePresentation = presentation
        self.rateFlavor = flavor
        self.ratePrice = price
        self.rateTotal = total
    }
    
    public func setName(name: String) {
        if (name.isEmpty){
            self.name = ""
        } else {
            self.name = name
        }
    }
    public func setImage(image: UIImage!) {
        self.image = image
    }
    public func setComment(comment: String!) {
        self.comment = comment
    }
    public func setRatePresentation(presentation: Int) {
        if (presentation >= 0 && presentation <= 5) {
            self.ratePresentation = presentation
        } else if (presentation > 5) {
            self.ratePresentation = 5
        } else {
            self.ratePresentation = 0
        }
    }
    public func setRateFlavor(flavor: Int) {
        if (flavor >= 0 && flavor <= 5) {
            self.rateFlavor = flavor
        } else if (flavor > 5) {
            self.rateFlavor = 5
        } else {
            self.rateFlavor = 0
        }
    }
    public func setRatePrice(price: Int) {
        if (price >= 0 && price <= 5) {
            self.ratePrice = price
        } else if (price > 5) {
            self.ratePrice = 5
        } else {
            self.ratePrice = 0
        }
    }
    public func setRateTotal(total: Int) {
        if (total >= 0 && total <= 5) {
            self.rateTotal = total
        } else if (total > 5) {
            self.rateTotal = 5
        } else {
            self.rateTotal = 0
        }
    }
    
}
