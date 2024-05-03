//
//  MyStatusStructure.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import Foundation

struct YearMonthDay {
    var year: Int
    var month: Int
    var day: Int
}

struct MyStatus {
    var name: String
    var birthday: YearMonthDay
    var bloodType: String
    var today = Date()
}


extension Date {
    
}
