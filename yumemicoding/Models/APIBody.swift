//
//  APIBody.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/05.
//

import Foundation

class YearMonthDay: Encodable {
    var year: Int
    var month: Int
    var day: Int
    
    init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}


struct Body: Encodable {
    let name: String
    let birthday: YearMonthDay
    let bloodType: String
    let today: YearMonthDay
    
    init(name: String, birthday: YearMonthDay, bloodType: String, today: YearMonthDay) {
        self.name = name
        self.birthday = birthday
        self.bloodType = bloodType
        self.today = today
    }
}

func convertProfileToBody(myProfile: MyProfile) -> Body {
    let today = Date().getYearMonthDay()
    return Body(name: myProfile.name, birthday: myProfile.birthday.getYearMonthDay(), bloodType: myProfile.bloodType, today: today)
}
