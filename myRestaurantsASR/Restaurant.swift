//
//  Restaurant.swift
//  myRestaurantsASR
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class Restaurant {
    
    //MARK: Properties
    public private(set) var name: String
    public private(set) var image: UIImage!
    public private(set) var address: String!
    public private(set) var comment: String!
    public private(set) var rateLocation: Int
    public private(set) var rateAttendance: Int
    public private(set) var rateCleaning: Int
    public private(set) var rateTotal: Int
    public private(set) var breakfast: Meal!
    public private(set) var lunch: Meal!
    public private(set) var dinner: Meal!
    
    init(name: String, image: UIImage!, address: String!, comment: String!, location: Int, attendance: Int, cleaning: Int, total: Int, breakfast: Meal!, lunch: Meal!, dinner: Meal!) {
        self.name = name
        self.image = image
        self.address = address
        self.comment = comment
        self.rateLocation = location
        self.rateAttendance = attendance
        self.rateCleaning = cleaning
        self.rateTotal = total
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
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
    public func setRateLocation(location: Int) {
        if (location >= 0 && location <= 5) {
            self.rateLocation = location
        } else if (location > 5) {
            self.rateLocation = 5
        } else {
            self.rateLocation = 0
        }
    }
    public func setRateAttendance(attendance: Int) {
        if (attendance >= 0 && attendance <= 5) {
            self.rateAttendance = attendance
        } else if (attendance > 5) {
            self.rateAttendance = 5
        } else {
            self.rateAttendance = 0
        }
    }
    public func setRateCleaning(cleaning: Int) {
        if (cleaning >= 0 && cleaning <= 5) {
            self.rateCleaning = cleaning
        } else if (cleaning > 5) {
            self.rateCleaning = 5
        } else {
            self.rateCleaning = 0
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
    public func setBreakfast(breakfast: Meal!) {
        self.breakfast = breakfast
    }
    public func setLunch(lunch: Meal!) {
        self.lunch = lunch
    }
    public func setDinner(dinner: Meal!) {
        self.dinner = dinner
    }
    
}
