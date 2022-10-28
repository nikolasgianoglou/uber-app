//
//  HomeController.swift
//  Uber
//
//  Created by Nikolas Gianoglou Coelho on 28/10/22.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        view.backgroundColor = .systemBlue
    }
}

extension HomeController {
    //MARK: - Selectors
}

extension HomeController {
    //MARK: - Helper Functions
    
    //MARK: - API
    private func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                if #available(iOS 13.0, *) {
                    nav.isModalInPresentation = true
                }
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
           print("UUUID: \(Auth.auth().currentUser?.uid)")
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: Error signing out \(error.localizedDescription)")
        }
    }
}
