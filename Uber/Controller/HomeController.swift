//
//  HomeController.swift
//  Uber
//
//  Created by Nikolas Gianoglou Coelho on 28/10/22.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    //MARK: - Properties
    private let mapView = MKMapView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        signOut()
    }
}

extension HomeController {
    //MARK: - Selectors
}

extension HomeController {
    //MARK: - Helper Functions
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
    
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
            configureUI()
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
