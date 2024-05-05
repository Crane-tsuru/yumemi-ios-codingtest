//
//  fortuneAPI.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/02.
//

import Foundation

class MonthDay: Codable {
    let month: Int
    let day: Int
}

class ResponseStatus: Codable {
    let name: String
    let capital: String
    let citizenDay: MonthDay?
    let hasCoastLine: Bool
    let logoURL: String
    let brief: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case citizenDay = "citizen_day"
        case hasCoastLine = "has_coast_line"
        case logoURL = "logo_url"
        case brief
    }
    
    init() {
        self.name = ""
        self.capital = ""
        self.citizenDay = nil
        self.hasCoastLine = false
        self.logoURL = ""
        self.brief = ""
    }
}


class FortuneAPIViewController: ObservableObject {
    @Published var responseStatus = ResponseStatus()
    
    func getResponse(profile: MyProfile) async {
        let url = URL(string: "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud/my_fortune")!
        var request = URLRequest(url: url)
        let today = Date().getYearMonthDay()

        request.httpMethod = "POST"
        request.addValue("v1", forHTTPHeaderField: "API-Version")
        request.httpBody = "name=\(profile.name)&birthday=\(profile.birthday)&blood_type=\(profile.bloodType.lowercased())&today=\(today)".data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data = nil")
                return
            }
                
            do {
                let decoder = JSONDecoder()
                self.responseStatus = try decoder.decode(ResponseStatus.self, from: data)
                print("success")
            } catch {}
        }.resume()
    }
}
