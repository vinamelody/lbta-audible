//
//  MainNavigationController.swift
//  lbta-audible
//
//  Created by Vina Melody on 21/1/17.
//  Copyright © 2017 Vina Rianti. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple
        
        let isLoggedIn = true
        
        if isLoggedIn {
            // assume user is logged in
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            
        })
    }
}

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
    }
}
