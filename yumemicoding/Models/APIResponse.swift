//
//  fortuneAPI.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/02.
//

import Foundation


final class MonthDay: Codable {
    let month: Int
    let day: Int
}

final class ResponseStatus: Codable {
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

final class API {
    private var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        return encoder
    }()
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }()
    
    func fetchFortune(body: FortuneRequestBody) async throws -> ResponseStatus {
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
            
//            if let httpResponse = response as? HTTPURLResponse {
//                if 400 <= httpResponse.statusCode {
//                    print("status code error")
//                }
//            }
            
            let fetchedResponse = try self.decoder.decode(ResponseStatus.self, from: data)
            print("success")
            return fetchedResponse
        } catch  {
            print("Error : \(error)")
            throw error
        }
        
    }
}

@MainActor
final class FortuneAPIViewModel: ObservableObject {
    private let api = API()
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
    
    func getResponse(body: FortuneRequestBody) async {
        do {
            responseStatus = try await api.fetchFortune(body: body)
        } catch {
            print(error)
        }
    }
}
