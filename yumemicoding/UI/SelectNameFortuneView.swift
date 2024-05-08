//
//  SelectNameFortuneVIew.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/04.
//

import SwiftUI
import SwiftData

struct SelectNameFortuneView: View {
    
    @Query private var profileList: [MyProfile]
    @State var editSheet = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(profileList) { profile in
                    NavigationLink(destination: ResultDetailView(profile: profile)) {
                        Text(profile.name)
                    }
                }
            }
            .navigationTitle("占リスト")
            .navigationBarItems(trailing: Button(action: {
                editSheet = true
            }) {
                Image(systemName: "plus")
                    .padding()
                    .scaleEffect(1.3)
            })
        }
        .sheet(isPresented: $editSheet) {
            NavigationStack {
                EditProfileView(editSheet: $editSheet)
            }
        }
    }
}

#Preview {
    SelectNameFortuneView()
        .modelContainer(for: MyProfile.self)
}
