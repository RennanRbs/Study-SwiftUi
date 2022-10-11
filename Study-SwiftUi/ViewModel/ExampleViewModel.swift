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
        @Published private(set) var food: Food?
        
        func fetchNewFood() {
            FoodApi().loadData { food in
                self.food = food
            }
        }
    }
}
