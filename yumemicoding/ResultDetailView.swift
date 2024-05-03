//
//  ResultDetailView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI

struct ResultDetailView: View {
    let responseStatus: ResponseStatus
    @State var showBrief = false
    
    var body: some View {
        
        ScrollView {
            
            AsyncImage(url: URL(string: responseStatus.logoURL))
            
            List {
                
                Text("都道府県名: \(responseStatus.name)")
                Text("県庁所在地: \(responseStatus.capital)")
                
                if let citizenDay = responseStatus.citizenDay {
                    Text("県民の日: \(citizenDay)")
                } else {
                    Text("県民の日はありません")
                }
                
                Text("海岸線の有無: \(responseStatus.hasCoastLine ? "有" : "無")")
                VStack {
                    Toggle(isOn: $showBrief) {
                        Text("詳細を見る")
                    }
                    
                    if showBrief {
                        Text(responseStatus.brief)
                    }
                }
                
            }
            
        }
        
    }
}

//#Preview {
//    ResultDetailView()
//}
