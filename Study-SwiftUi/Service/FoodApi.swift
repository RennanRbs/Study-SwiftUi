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

enum FoodApiURL {
    case base
    case mock
    case specificDish(path: TypeOfDishes)
    
    var url: URL {
        switch self {
        case .base:
            return URL(string: "https://foodish-api.herokuapp.com/api/")!
        case .mock:
            return URL(string: "localhost:3003")!
        case let .specificDish(path):
            return URL(string: "https://foodish-api.herokuapp.com/api/images/\(path)")!
        }
    }
}

@MainActor class FoodApi: ObservableObject {

    @Published var food = Food(image: "https://foodish-api.herokuapp.com/images/biryani/biryani2.jpg")
    
    func loadData(typeOfDish: TypeOfDishes,completion:@escaping  (Food) -> Void) {
        var url: URL
        if typeOfDish == .all {
            url = FoodApiURL.base.url
        } else {
            url = FoodApiURL.specificDish(path: typeOfDish).url
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
