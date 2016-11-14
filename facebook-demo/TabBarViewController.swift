//
//  TabBarViewController.swift
//  facebook-demo
//
//  Created by Michael Volovar on 11/13/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var newsFeedViewController: NewsFeedViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        newsFeedViewController = viewControllers![0] as? NewsFeedViewController
    }

}
