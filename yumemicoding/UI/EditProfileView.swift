//
//  InputParameterView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/02.
//

import SwiftUI

struct EditProfileView: View {
    @State var name = ""
    @State var birthday = Date()
    @State var bloodType = ""
    @State var bloodSelection = 0
    
    @Binding var editSheet: Bool
    
    @Environment(\.modelContext) private var modelContext
    
    @FocusState private var inputNameDone: Bool
    
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
                        .focused($inputNameDone)
                        .toolbar {
                            
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button(action: {
                                    inputNameDone = false
                                }) {
                                    Text("閉じる")
                                }
                            }
                        }
                }.padding()
                
                Text("誕生日").padding()
                DatePicker(
                    "",
                    selection: $birthday,
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
                modelContext.insert(MyProfile(
                    name: name,
                    birthday: birthday,
                    bloodType: bloodTypes[bloodSelection]))
                editSheet = false
            }) {
                Text("保存")
            }.disabled(name == "")
        }
        
    }
}

#Preview {
    EditProfileView(editSheet: .constant(true))
}
