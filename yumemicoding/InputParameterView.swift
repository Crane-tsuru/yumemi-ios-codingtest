//
//  InputParameterView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/02.
//

import SwiftUI

struct InputParameterView: View {
    @State var name = ""
    @State var theDate = Date()
    @State var bloodType = ""
    
    @State var bloodSelection = 0
    
    var body: some View {
        ScrollView {
            Text("以下の項目を入力してください")
                .padding()
                .font(.title2)
            Spacer()
            VStack(alignment: .leading) {
                Text("名前")
                TextField("山田太郎", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250)
            }.padding()
            
            VStack(alignment: .leading) {
                DatePicker(
                    "誕生日",
                    selection: $theDate,
                    in: dateRange,
                    displayedComponents: [.date]
                )
                    .padding()
                    .environment(\.locale, Locale(identifier: "ja_JP"))
            }.padding()
            
            HStack {
                Text("血液型")
                Picker(selection: $bloodSelection, label: Text("血液型")) {
                    Text("A").tag(0)
                    Text("AB").tag(1)
                    Text("B").tag(2)
                    Text("O").tag(3)
                }
            }.padding()
        }
    }
}

#Preview {
    InputParameterView()
}
