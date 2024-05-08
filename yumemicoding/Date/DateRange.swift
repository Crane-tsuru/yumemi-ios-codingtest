//
//  File.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/02.
//
import SwiftUI

private let yearsBefore = -110

var dateRange: ClosedRange<Date> {
    let today = Date()
    
    let min = Calendar.current.date(byAdding: .year, value: yearsBefore, to: today)!
    return min...today
}

