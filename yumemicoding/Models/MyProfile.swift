//
//  MyStatusStructure.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import Foundation
import SwiftData


@Model
class MyProfile: ObservableObject {
    var name: String
    var birthday: Date
    var bloodType: String
    
    init(name: String, birthday: Date, bloodType: String) {
        self.name = name
        self.birthday = birthday
        self.bloodType = bloodType
    }
}

extension MyProfile {
    static func emptyProfile() -> MyProfile {
        MyProfile(name: "", birthday: Date(), bloodType: "")
    }
}

let bloodTypes = ["A", "AB", "B", "O"]
