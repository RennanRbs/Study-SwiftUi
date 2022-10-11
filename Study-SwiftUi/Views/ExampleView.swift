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
        GeometryReader { metrics in
            VStack {
                if let food = food {
                    AsyncImage(url: URL(string: food.image)) { image in
                        image
                            .resizable()
                            .padding()
                            .frame(width: metrics.size.width, height: metrics.size.height * 0.6)
                                
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
