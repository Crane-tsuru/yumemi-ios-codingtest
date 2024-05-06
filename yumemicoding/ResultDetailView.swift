//
//  ResultDetailView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/03.
//

import SwiftUI


struct ResultDetailView: View {
    @State var showBrief = false
    
    let profile: MyProfile
    
    @ObservedObject var fortuneAPIViewController = FortuneAPIViewController()
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: fortuneAPIViewController.responseStatus.logoUrl))
                .scaleEffect(0.75)
            
            List {
                
                Text("都道府県名: \(fortuneAPIViewController.responseStatus.name)")
                Text("県庁所在地: \(fortuneAPIViewController.responseStatus.capital)")
                
                if let citizenDay = fortuneAPIViewController.responseStatus.citizenDay {
                    Text("県民の日: \(citizenDay)")
                } else {
                    Text("県民の日はありません")
                }
                
                Text("海岸線の有無: \(fortuneAPIViewController.responseStatus.hasCoastLine ? "有" : "無")")
                VStack {
                    Toggle(isOn: $showBrief) {
                        Text("詳細を見る")
                    }
                    
                    if showBrief {
                        Text(fortuneAPIViewController.responseStatus.brief)
                    }
                }
                
            }
            
        }
        .onAppear{
            let APIBody = convertProfileToBody(myProfile: profile)
            Task {
                await fortuneAPIViewController.getResponse(body: APIBody)
            }
        }
    }
}


//#Preview {
//    ResultDetailView()
//}
