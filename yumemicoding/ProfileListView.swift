//
//  ProfileListView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI
import SwiftData

struct ProfileListView: View {
    @Query private var profileList: [MyProfile]
    @State var editSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(profileList) { profile in
                    NavigationLink(destination: ProfileDetailView(myProfile: profile)) {
                            Text(profile.name)
                    }
                }
            }
            .navigationBarTitle("プロフィール")
            .navigationBarItems(trailing: Button(action: {
                editSheet = true
            }) {
                Image(systemName: "plus").padding().scaleEffect(1.3)
            })
        }.sheet(isPresented: $editSheet) {
            EditProfileView(editSheet: $editSheet)
        }
    }
}

#Preview {
    ProfileListView()
}
