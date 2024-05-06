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
    let logoUrl: String
    let brief: String
    
    init() {
        self.name = ""
        self.capital = ""
        self.citizenDay = nil
        self.hasCoastLine = false
        self.logoUrl = ""
        self.brief = ""
    }
}


class FortuneAPIViewController: ObservableObject {
    @Published var responseStatus = ResponseStatus()
    
    let decoder: JSONDecoder = {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      return decoder
    }()
    
    let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        return encoder
    }()
    
    func getResponse(body: Body) async {
        let url = URL(string: "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud/my_fortune")!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("v1", forHTTPHeaderField: "API-Version")
        
        do {
            // Encode
            let json = try self.encoder.encode(body)
            request.httpBody = json
            
            // Decode
            let (data, response) = try await URLSession.shared.data(for: request)
            
//            print(String(data: data, encoding: .utf8) as Any) //debug
            
            if let httpResponse = response as? HTTPURLResponse {
                if 400 <= httpResponse.statusCode {
                    print("status code error")
                }
            }
            
            self.responseStatus = try self.decoder.decode(ResponseStatus.self, from: data)
            print("success")
            
            
        } catch  {
            print("Error : \(error)")
        }
        
    }
}
