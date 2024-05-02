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
                HStack {
                    Text("名前")
                    TextField("山田太郎", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                
                Text("誕生日").padding()
                DatePicker(
                    "",
                    selection: $theDate,
                    in: dateRange,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                
                
                HStack {
                    Text("血液型")
                    Picker("血液型" ,selection: $bloodSelection) {
                        Text("A").tag(0)
                        Text("AB").tag(1)
                        Text("B").tag(2)
                        Text("O").tag(3)
                    }
                }.padding()
            }.padding()
        }
    }
}

#Preview {
    InputParameterView()
}
