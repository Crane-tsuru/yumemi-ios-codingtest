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
                Text("名前: \(myProfile.name)")
                Text("誕生日: \(DateFormatter.stringFormatYMD(date: myProfile.birthday))")
                Text(myProfile.birthday.description)
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
                            birthday: myProfile.birthday,
                            bloodType: myProfile.bloodType,
                            editSheet: $editSheet)
        }
    }
}
