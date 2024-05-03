//
//  ProfileListView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI
import SwiftData

struct ProfileListView: View {
    @Query private var statusList: [MyStatus]
    
    var body: some View {
        List {
            ForEach(statusList) { status in
                Text(status.name)
            }
        }
    }
}

#Preview {
    ProfileListView()
}
