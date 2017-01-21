//
//  HomeController.swift
//  lbta-audible
//
//  Created by Vina Melody on 21/1/17.
//  Copyright © 2017 Vina Rianti. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleSignOut))
        
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        // Note: sometimes, the simulator doesn't exactly save the value properly. Becareful with that. In the actual device though it's working
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
