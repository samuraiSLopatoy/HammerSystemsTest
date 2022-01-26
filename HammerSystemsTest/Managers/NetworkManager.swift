//
//  NetworkManager.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let api = "https://api.punkapi.com/v2/beers"
    
    func fetchData(completion: @escaping (_ category: [Category]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            
            do {
                let category = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(category)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
