//
//  Login.swift
//  HiU
//
//  Created by Lady Diana Cortes on 15/10/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit
import AWSAuthUI
import AWSFacebookSignIn

class Login: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//      presentAuthUIViewController()
        // Do any additional setup after loading the view.
    }
    
    func presentAuthUIViewController() {
        let config = AWSAuthUIConfiguration()
        config.addSignInButtonView(class: AWSFacebookSignInButton.self)
        
        // you can use properties like logoImage, backgroundColor to customize screen
        // config.canCancel = false // this will disallow end user to dismiss sign in screen
        
        // you should have a navigation controller for your view controller
        // the sign in screen is presented using the navigation controller
        
        AWSAuthUIViewController.presentViewController(
            with: navigationController!,  // you should have your navigation controller here
            configuration: config,
            completionHandler: {(
                _ signInProvider: AWSSignInProvider, _ error: Error?) -> Void in
                if error == nil {
                    DispatchQueue.main.async(execute: {() -> Void in
                        // handle successful callback here,
                        // e.g. pop up to show successful sign in
                    })
                }
                else {
                    // end user faced error while loggin in,
                    // take any required action here
                }
        })
    }
}
