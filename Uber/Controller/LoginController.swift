//
//  ViewController.swift
//  Uber
//
//  Created by Nikolas Gianoglou Coelho on 22/10/22.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
       return label
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
    }
    
    ///To change the status barStyle to white:
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

