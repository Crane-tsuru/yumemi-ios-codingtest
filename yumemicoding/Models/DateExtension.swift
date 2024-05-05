//
//  DateExtension.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import Foundation

extension Date {
    
    func getYearMonthDay() -> YearMonthDay {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        
        return YearMonthDay(year: components.year ?? 0, month: components.month ?? 0, day: components.day ?? 0)
    }
}
