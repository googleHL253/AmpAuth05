//
//  ViewController.swift
//  AmpAuth05
//
//  Created by Google3 on 1/24/20.
//  Copyright © 2020 locust communications. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        showSignIn()
    }

    func showSignIn() {
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController
                .presentViewController(with: self.navigationController!,
                                       configuration: nil,
                                       completionHandler: {
                    (provider: AWSSignInProvider, error:Error?) in
                    if error != nil {
                        print("Error occured: \(String(describing: error))")
                        } else {
                            //Signin successful.

                        print("Logged in with provider: \(provider.identityProviderName) with Token: \(provider.token())")
                        }
                    })
        }
    }
}

