//
//  MyStatusStructure.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import Foundation
import SwiftData

@Model
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

extension YearMonthDay {
    func getDate() -> Date {
        let dateComponents = DateComponents(year: self.year, month: self.month, day: self.day)
        
        if let customDate = Calendar.current.date(from: dateComponents) {
            return customDate
        } else {
            print("failed to convert YearMonthDay to Date")
            return Date()
        }
    }
}

@Model
class MyProfile: ObservableObject, Equatable {
    var name: String
    var birthday: YearMonthDay
    var bloodType: String
    
    init(name: String, birthday: YearMonthDay, bloodType: String) {
        self.name = name
        self.birthday = birthday
        self.bloodType = bloodType
    }
}

extension MyProfile {
    static func emptyProfile() -> MyProfile {
        MyProfile(name: "", birthday: YearMonthDay(year: 0, month: 0, day: 0), bloodType: "")
    }
}

let bloodTypes = ["A", "AB", "B", "O"]
