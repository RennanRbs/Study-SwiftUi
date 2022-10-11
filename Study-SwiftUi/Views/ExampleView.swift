//
//  ExampleView.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        VStack {
            Text("Essa View usa SwiftUI")
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
