//
//  FoodApi.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import Foundation

enum ApiError: Error {
    case URLError
    case DecodeError
}

enum URLs: String {
    case base = "https://foodish-api.herokuapp.com/api/"
    case mock = "http://localhost:3003"
}

class FoodApi: ObservableObject {

    @Published var food = Food(image: "https://foodish-api.herokuapp.com/images/biryani/biryani2.jpg")
    
    func loadData(completion:@escaping  (Food) -> Void) {
        guard let url = URL(string: URLs.base.rawValue) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let food = try JSONDecoder().decode(Food.self, from: data!)
                DispatchQueue.main.async {
                    completion(food)
                }
            } catch {
                return
            }
            
        }.resume()
        
    }
}
