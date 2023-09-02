//
//  NetworkManager.swift
//  xcodeSample
//
//  Created by Dharam Dhurandhar on 03/09/23.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataFromAPI(completionHandler: @escaping ((DataT?)->Void)) {
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of: DataT.self, completionHandler: { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                completionHandler(data)
            case .failure:
                completionHandler(nil)
            }
        })
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
