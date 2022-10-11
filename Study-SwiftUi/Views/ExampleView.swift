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

    @StateObject private var viewModel = ExampleViewModel()

    var body: some View {
        GeometryReader { metrics in
            VStack {
                HStack {
                    Text("Select a type of dish: ")
                        .font(.body)
                    Picker("Types of dishes", selection: $viewModel.typeOfDishSelected) {
                        ForEach(TypeOfDishes.allCases, id: \.self) {
                            Text($0.rawValue.uppercased())
                        }
                    }
                }
                if viewModel.isLoading {
                    ShimmerView()
                        .padding()
                        .frame(width: metrics.size.width, height: metrics.size.height * 0.6)
                } else {
                    AsyncImage(url: URL(string: viewModel.food.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(width: metrics.size.width, height: metrics.size.height * 0.6)
                    } placeholder: {
                        ShimmerView()
                            .padding()
                            .frame(width: metrics.size.width, height: metrics.size.height * 0.6)
                    }
                }
                
                Button("Another dish") {
                    viewModel.fetchNewFood()
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
        ExampleView()
    }
}
