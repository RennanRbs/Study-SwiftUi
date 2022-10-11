//
//  ViewController.swift
//  Study-SwiftUi
//
//  Created by Rennan Rebouças on 03/10/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let hostingController = UIHostingController(rootView: ExampleView())

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupHostingControllerConstraints()
    }
    
    private func setView() {
        addChild(hostingController)
        view.addSubview(hostingController.view)
    }
    
    private func setupHostingControllerConstraints() {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

