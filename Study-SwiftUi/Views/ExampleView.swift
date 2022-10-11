//
//  ExampleView.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import SwiftUI

struct ExampleView: View {

    @StateObject private var viewModel = ExampleViewModel()
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                if let food = viewModel.food {
                    AsyncImage(url: URL(string: food.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(width: metrics.size.width, height: metrics.size.height * 0.6)
                                
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    ProgressView()
                        .padding()
                        .onAppear() {
                            viewModel.fetchNewFood()
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
