//
//  ImageDetailViewController.swift
//  facebook-demo
//
//  Created by Michael Volovar on 11/10/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        imageView.image = image
    }
    
    @IBAction func didPressDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
