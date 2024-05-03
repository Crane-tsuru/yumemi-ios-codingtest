//
//  ProfileDetailView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI

struct ProfileDetailView: View {
    let myProfile: MyProfile
    
    var body: some View {
        List {
            Text("name: \(myProfile.name)")
            Text("誕生日: \(myProfile.birthday.year)年\(myProfile.birthday.month)月\(myProfile.birthday.day)日")
            Text("血液型: \(myProfile.bloodType)型")
        }
    }
}
