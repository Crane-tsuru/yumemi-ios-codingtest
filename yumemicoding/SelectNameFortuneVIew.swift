//
//  SelectNameFortuneVIew.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/04.
//

import SwiftUI
import SwiftData

struct SelectNameFortuneView: View {
    @State var isSheet = false
    
    @Query private var profileList: [MyProfile]
    
    var body: some View {
        VStack {
            Text("占リスト")
            
            List {
                ForEach(profileList) { profile in
                    Button(action: {
                        isSheet = true
                    }) {
                        Text(profile.name)
                    }
                }
            }.sheet(isPresented: $isSheet) {
                EmptyView()
            }
        }
    }
}

#Preview {
    SelectNameFortuneView()
}
