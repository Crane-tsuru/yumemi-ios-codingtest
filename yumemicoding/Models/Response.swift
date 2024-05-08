//
//  fortuneAPI.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/02.
//

import Foundation


final class MonthDay: Codable {
    let month: Int
    let day: Int
}

final class ResponseStatus: Codable {
    let name: String
    let capital: String
    let citizenDay: MonthDay?
    let hasCoastLine: Bool
    let logoUrl: String
    let brief: String
    
    init() {
        self.name = ""
        self.capital = ""
        self.citizenDay = nil
        self.hasCoastLine = false
        self.logoUrl = ""
        self.brief = ""
    }
}
