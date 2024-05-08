import Foundation

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
            let (data, response) = try await URLSession.shared.data(for: request) // response is for debug
            
//            print(String(data: data, encoding: .utf8) as Any) //debug
            
            if let httpResponse = response as? HTTPURLResponse {
                if 400 <= httpResponse.statusCode {
                    print("status code error")
                }
            }
            
            let fetchedResponse = try self.decoder.decode(ResponseStatus.self, from: data)
            return fetchedResponse
        } catch  {
            print("Error : \(error)")
            throw error
        }
        
    }
}
