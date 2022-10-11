//
//  ExampleView.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import SwiftUI

enum TypeOfDishes: String, CaseIterable {
    case burger
    case pizza
    case rice
    case all
}

struct ExampleView: View {
    
    @State var food = Food(image: "https://foodish-api.herokuapp.com/images/biryani/biryani2.jpg")
    @State var typeOfDishSelected: TypeOfDishes = .all
    var body: some View {
        GeometryReader { metrics in
            VStack {
                HStack {
                    Text("Select a type of dish: ")
                        .font(.body)
                    Picker("Types of dishes", selection: $typeOfDishSelected) {
                        ForEach(TypeOfDishes.allCases, id: \.self) {
                            Text($0.rawValue.uppercased())
                        }
                    }
                }
                    AsyncImage(url: URL(string: food.image)) { image in
                        image
                            .resizable()
                            .padding()
                            .frame(width: metrics.size.width, height: metrics.size.height * 0.6)
                                
                    } placeholder: {
                        ShimmerView()
                            .frame(width: metrics.size.width, height: metrics.size.height * 0.6, alignment: .center)
                            .padding()
                    }
                
                Button("Another dish") {
                    FoodApi().loadData { food in
                        self.food = food
                    }
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())
            }
        }
        
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(food: Food(image: "https://foodish-api.herokuapp.com/images/biryani/biryani2.jpg"))
    }
}
