//
//  GetResponse.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/08.
//

import Foundation

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
