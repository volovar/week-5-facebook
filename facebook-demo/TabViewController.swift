//
//  TabViewController.swift
//  facebook-demo
//
//  Created by Michael Volovar on 11/10/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var newsFeedViewController: UIViewController!
    var requestsViewController: UIViewController!
    var messagesViewController: UIViewController!
    var notificationsViewController: UIViewController!
    var moreViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        newsFeedViewController = mainStoryboard.instantiateViewController(withIdentifier: "NewsFeedViewController")
        requestsViewController = mainStoryboard.instantiateViewController(withIdentifier: "RequestsViewController")
        messagesViewController = mainStoryboard.instantiateViewController(withIdentifier: "MessagesViewController")
        notificationsViewController = mainStoryboard.instantiateViewController(withIdentifier: "NotificationsViewController")
        moreViewController = mainStoryboard.instantiateViewController(withIdentifier: "MoreViewController")
        
        viewControllers = [newsFeedViewController, requestsViewController, messagesViewController, notificationsViewController, moreViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }

    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        let previousVC = viewControllers[previousIndex]
        
        // get new selected index and set the current view controller
        selectedIndex = sender.tag
        let vc = viewControllers[selectedIndex]
        
        // update selected states of previous button and current button
        buttons[previousIndex].isSelected = false
        sender.isSelected = true
        
        // remove previous view controller
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // add new view controller and set it's size
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
}
