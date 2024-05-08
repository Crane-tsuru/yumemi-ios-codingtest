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
    
    @ObservedObject var fortuneAPIViewModel = FortuneAPIViewModel()
    
    var body: some View {
        
        VStack {
            
            AsyncImage(
                url: URL(string: fortuneAPIViewModel.responseStatus.logoUrl),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 150)
                },
                placeholder: {
                    ProgressView()
                }
            )
                
            
            List {
                
                Text("都道府県名: \(fortuneAPIViewModel.responseStatus.name)")
                Text("県庁所在地: \(fortuneAPIViewModel.responseStatus.capital)")
                
                if let citizenDay = fortuneAPIViewModel.responseStatus.citizenDay {
                    Text("県民の日: \(citizenDay)")
                } else {
                    Text("県民の日はありません")
                }
                
                Text("海岸線の有無: \(fortuneAPIViewModel.responseStatus.hasCoastLine ? "有" : "無")")
                VStack {
                    Toggle(isOn: $showBrief) {
                        Text("詳細を見る")
                    }
                    
                    if showBrief {
                        Text(fortuneAPIViewModel.responseStatus.brief)
                    }
                }
                
            }
            Spacer()
        }
        .onAppear{
            let APIBody = convertProfileToBody(myProfile: profile)
            Task {
                await fortuneAPIViewModel.getResponse(body: APIBody)
            }
        }
    }
}


//#Preview {
//    ResultDetailView()
//}
