//
//  DateFormat.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/07.
//

import Foundation

//final class RemakeDateFomatter {
//    let df = DateFormatter()
//    df.timeStyle = .long
//    
//}

extension DateFormatter {
    static func MyStringFormat(date: Date) -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        
        df.dateStyle = .long
        df.timeStyle = .none
        
//        df.calendar = Calendar(identifier: .japanese)
//        df.dateFormat = "yyyy年mm月dd日"
        
        return df.string(from: date)
    }
}
