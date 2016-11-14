//
//  LoginViewController.swift
//  facebook-demo
//
//  Created by Michael Volovar on 10/20/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var fbLogoView: UIImageView!
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var labelSuperview: UIView!
    
    var initialYFbLogoView: CGFloat!
    var initialYFieldSuperview: CGFloat!
    var initialYLabelSuperview: CGFloat!
    
    var offsetFbLogoView: CGFloat!
    var offsetFieldSuperview: CGFloat!
    var offsetLabelSuperview: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialYFbLogoView = fbLogoView.frame.origin.y
        initialYFieldSuperview = fieldSuperview.frame.origin.y
        initialYLabelSuperview = labelSuperview.frame.origin.y
        
        offsetFbLogoView = initialYFbLogoView - 50
        offsetFieldSuperview = initialYFieldSuperview - 90
        offsetLabelSuperview = initialYLabelSuperview - 280
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (Notification) in
            self.fbLogoView.frame.origin.y = self.offsetFbLogoView
            self.fieldSuperview.frame.origin.y = self.offsetFieldSuperview
            self.labelSuperview.frame.origin.y = self.offsetLabelSuperview
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (Notification) in
            // add code for keyboard hiding
            self.fbLogoView.frame.origin.y = self.initialYFbLogoView
            self.fieldSuperview.frame.origin.y = self.initialYFieldSuperview
            self.labelSuperview.frame.origin.y = self.initialYLabelSuperview
        }
    }

    @IBAction func didTap(_ sender: Any) {
        view.endEditing(true)
    }

}
