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
    @State var openSheet = false
    
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
                openSheet = true
            }) {
                Image(systemName: "plus")
                    .padding()
                    .scaleEffect(1.3)
            })
        }
        .sheet(isPresented: $openSheet) {
            EditProfileView(editSheet: $openSheet)
        }
    }
}

#Preview {
    SelectNameFortuneView()
}
