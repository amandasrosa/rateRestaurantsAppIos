//
//  RestaurantTableViewCell.swift
//  myRestaurantsASR
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var rateTotal: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
