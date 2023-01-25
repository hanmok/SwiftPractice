//
//  ImageProvider.swift
//  CachePractice
//
//  Created by Mac mini on 2023/01/24.
//

import UIKit

class ImageProvider {
    static let shared = ImageProvider()
    private init(){}
    
    private let cache = NSCache<NSString, UIImage>()
    // NSCache: A mutable collection you use to temporarily strore transient key-valud pairs that are subject to eviction when resources are low.
    
    public func fetchImage(completion: @escaping (UIImage?) -> Void) {
        
        if let image = cache.object(forKey: "image") {
            print("Using Cache")
            completion(image)
            return
        }
        
        guard let url = URL(string: "https://source.unsplash.com/random/500x500") else {
            completion(nil)
            return
        }
        print("fetching image")
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { completion(nil);return}
                self?.cache.setObject(image, forKey: "image")
                completion(image)
            }
        }
        task.resume()
    }
}
