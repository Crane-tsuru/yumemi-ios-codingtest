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
    
    let bloodTypes = ["A", "AB", "B", "O"]
    
    @Environment(\.modelContext) private var modelContext
    
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
                        Text(bloodTypes[0]).tag(0)
                        Text(bloodTypes[1]).tag(1)
                        Text(bloodTypes[2]).tag(2)
                        Text(bloodTypes[3]).tag(3)
                    }
                }.padding()
                
            }.padding()
            
            Button(action: {
                modelContext.insert(MyStatus(name: name, birthday: theDate.getYearMonthDay(), bloodType: bloodTypes[bloodSelection]))
            }) {
                Text("保存")
            }
        }
        
    }
}

#Preview {
    InputParameterView()
}
