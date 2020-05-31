//
//  DayCell.swift
//  PeriodTracker
//
//  Created by Paola Castro on 3/17/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var circle: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circle.backgroundColor = .white
        circle.layer.cornerRadius = 15
        circle.layer.opacity = 0.3
        circle.clipsToBounds = true
    }

}
