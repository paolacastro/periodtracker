//
//  MonthGenerator.swift
//  PeriodTracker
//
//  Created by Paola Castro on 3/20/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import Foundation

struct MonthGenerator {
    let weekLength = 7
    let calendar = Calendar.current
    
    func threeMonthArray(for date:Date) -> (monthArray: [Any], endingDate: Date) {
        var nextDate = Date()
        var monthParty = [Any]()
        var counter = 0
        for _ in 0 ... 2 {
            nextDate = calendar.date(byAdding: .month, value: counter, to: date)!
            let month = self.OneMonthArray(for: nextDate)
            monthParty += month
            counter += 1
        }
        nextDate = calendar.date(byAdding: .month, value: counter, to: date)!
        return (monthArray: monthParty, endingDate: nextDate)
    }
    
    func OneMonthArray(for date:Date) -> [Any] {
        var display = [Any]()
        for _ in 1...weekLength {
            display.append("")
        }
        
        // 1. Day of the week
        let monthInterval = calendar.dateInterval(of: .month, for: date)
        let headDate = monthInterval?.start
        
        let headWeekDay = calendar.component(.weekday, from: headDate!)
        let headIndex = headWeekDay - 1
        
        // 2. Month Name
        let monthNameIndex = calendar.component(.month, from: headDate!) - 1
        display[headIndex] = calendar.shortMonthSymbols[monthNameIndex]
        
        // 3. Head Pad
        if headIndex > 0 {
            for _ in 1 ... headIndex {
                display.append("")
            }
        }
        
        // 4. Middle dates
        let tailDate = monthInterval?.end
        let daysInMonth = calendar.dateComponents([.day], from: headDate!, to: tailDate!).day
        for d in 0 ... daysInMonth! - 1 {
            if let safeDate = calendar.date(byAdding: .day, value: d, to: headDate!) {
                display.append(safeDate)
            }
            
        }
        
        // 5. Tail Pad
        let tailWeekDay = calendar.component(.weekday, from: tailDate!)
        for _ in tailWeekDay...weekLength {
            display.append("")
        }
        return display
    }
}
