//
//  ImageManager.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    private init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
//    func fetchImageData(from url: URL?) -> Data? {
//        guard let url = url else { return nil }
//        guard let imageData = try? Data(contentsOf: url) else { return nil }
//        return imageData
//    }
    
    func fetchImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let imageFromCache = cache.object(forKey: cacheKey) {
            completion(imageFromCache)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self?.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                completion(image)
            }
            
        }.resume()
        
    }
    
}
