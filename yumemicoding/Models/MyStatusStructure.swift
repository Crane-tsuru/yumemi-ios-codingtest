//
//  MyStatusStructure.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import Foundation

class YearMonthDay {
    var year: Int
    var month: Int
    var day: Int
    
    init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}

class MyStatus: ObservableObject {
    var name: String
    var birthday: YearMonthDay
    var bloodType: String
    var today = Date()
    
    init(name: String, birthday: YearMonthDay, bloodType: String, today: Date = Date()) {
        self.name = name
        self.birthday = birthday
        self.bloodType = bloodType
        self.today = today
    }
}


extension Date {
    func getYearMonthDay() -> YearMonthDay {
        let calendar = Calendar(identifier: .gregorian)
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        
        return YearMonthDay(year: year, month: month, day: day)
    }
}
