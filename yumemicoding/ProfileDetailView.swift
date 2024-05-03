//
//  ProfileDetailView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI

struct ProfileDetailView: View {
    let myProfile: MyProfile
    @State var editSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                Text("name: \(myProfile.name)")
                Text("誕生日: \(myProfile.birthday.year.description)年\(myProfile.birthday.month)月\(myProfile.birthday.day)日")
                Text("血液型: \(myProfile.bloodType)型")
            }
        }
        .navigationBarItems(trailing: Button(action: {
            editSheet = true
        }) {
            Text("編集")
        })
        .sheet(isPresented: $editSheet) {
            EditProfileView(name: myProfile.name,
                            birthday: myProfile.birthday.getDate(),
                            bloodType: myProfile.bloodType,
                            editSheet: $editSheet)
        }
    }
}
