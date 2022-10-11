//
//  ExampleView.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import SwiftUI

struct ExampleView: View {
    
    @State var food: Food?
    
    var body: some View {
        VStack {
            if let food = food {
                AsyncImage(url: URL(string: food.image)) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
            } else {
                ProgressView()
                    .padding()
                    .onAppear() {
                        FoodApi().loadData { food in
                            self.food = food
                        }
                    }
            }
            Spacer()
            Button("Another dish") {
                FoodApi().loadData { food in
                    self.food = food
                }
            }
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
