//
//  ProfileListView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI
import SwiftData

struct ProfileListView: View {
    @Query private var statusList: [MyProfile]
    @State var editSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(statusList) { status in
                    NavigationLink(destination: InputParameterView(
                        name: status.name,
                        birthday: status.birthday.getDate(),
                        bloodType: status.bloodType)) {
                            Text(status.name)
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
            InputParameterView()
        }
    }
}

#Preview {
    ProfileListView()
}
