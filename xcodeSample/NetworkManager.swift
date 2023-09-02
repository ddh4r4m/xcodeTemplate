//
//  NetworkManager.swift
//  xcodeSample
//
//  Created by Dharam Dhurandhar on 03/09/23.
//

import Foundation
//import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
//    func fetchDataFromAPI(completionHandler: @escaping (Result<DataT, Errors>)-> Void) {
//        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of: DataT.self, completionHandler: { response in
//            debugPrint(response)
//            switch response.result {
//            case .success(let data):
//                completionHandler(.success(data))
//            case .failure:
//                completionHandler(.failure(.invalidData))
//            }
//        })
//    }
    
    func fetchDataFromAPIUsingURLSession(completionHandler: @escaping (Result<DataT, Errors>)-> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)) { data, response, err in
            guard let data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode(DataT.self, from: data)
                completionHandler(.success(decodedResponse))
            }
            catch {
                completionHandler(.failure(.invalidData))
            }
        }.resume()
    }
}


struct DataModel : Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias DataT = [DataModel]

enum Errors: Error {
    case invalidData
    case noInternet
}
