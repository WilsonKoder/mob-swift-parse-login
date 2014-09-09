//
//  SecondViewController.swift
//  yourFeed
//
//  Created by Wilson Koder on 9/9/14.
//  Copyright (c) 2014 WilsonKoder. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    @IBOutlet var textFieldUsername: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldLoginUsername: UITextField!
    @IBOutlet var textFieldLoginPassword: UITextField!
    
    var isLoggedIn:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpButtonTouchUp(sender: AnyObject) {
        
        if(textFieldUsername.text != "" && textFieldPassword.text != "" && textFieldEmail.text != "")
        {
            var user:PFUser = PFUser()
            user.username = textFieldUsername.text
            user.password = textFieldPassword.text
            user.email = textFieldEmail.text
//            user.addObject(textFieldUsername.text, forKey: "username")
//            user.addObject(textFieldPassword.text, forKey: "password")
//            user.addObject(textFieldEmail.text, forKey: "email")
            user.signUpInBackground()
            
            var alertSuccess = UIAlertController(title: "We have Success!", message: "Yes! We did it!", preferredStyle: UIAlertControllerStyle.Alert)
            alertSuccess.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertSuccess, animated: true, completion: nil)
        }
        else
        {
            var alert = UIAlertController(title: "Something Went Wrong!", message: "Well you mustn't have filled something out!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func loginButtonTouchUp(sender: AnyObject) {
        var user:PFUser = PFUser()
        PFUser.logInWithUsername(textFieldLoginUsername.text, password: textFieldLoginPassword.text)
        var alertSuccess = UIAlertController(title: "Logged in Successfully", message: "Nice!", preferredStyle: UIAlertControllerStyle.Alert)
        alertSuccess.addAction(UIAlertAction(title: "Awesome!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertSuccess, animated: true, completion: nil)
        
    }
}

