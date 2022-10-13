//
//  ExampleViewModel.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import Foundation
import SwiftUI

extension ExampleView {
    @MainActor class ExampleViewModel: ObservableObject {
        @Published private(set) var food = Food(image: "https://foodish-api.herokuapp.com/images/biryani/biryani2.jpg")
        @Published var typeOfDishSelected: TypeOfDishes = .all
        @Published var isLoading = false
        
        
        
        func fetchNewFood() {
            isLoading = true
            
            FoodApi().loadData(typeOfDish: typeOfDishSelected) { food in
                self.isLoading = false
                self.food = food
            }
            
        }

    }
}
