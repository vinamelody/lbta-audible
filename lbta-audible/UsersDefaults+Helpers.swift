//
//  UsersDefaults+Helpers.swift
//  lbta-audible
//
//  Created by Vina Melody on 21/1/17.
//  Copyright © 2017 Vina Rianti. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: "isLoggedIn")
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: "isLoggedIn")
    }
}
