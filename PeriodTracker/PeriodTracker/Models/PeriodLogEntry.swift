//
//  PeriodLogEntry.swift
//  PeriodTracker
//
//  Created by Paola Castro on 5/30/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import Foundation
import RealmSwift

class PeriodLogEntry: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var length: Int = 5
}
