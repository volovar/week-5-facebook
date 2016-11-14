//
//  NewsFeedViewController.swift
//  facebook-demo
//
//  Created by Michael Volovar on 11/10/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var images: [UIImageView]!
    
    var imageDetailViewController: ImageDetailViewController!
    var selectedImageView: UIImageView!
    var zoomTransition: ZoomTransition!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        
        for image in images {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
            
            image.addGestureRecognizer(tapRecognizer)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ImageDetailSegue" {
            imageDetailViewController = segue.destination as? ImageDetailViewController
            imageDetailViewController!.image = selectedImageView.image
            zoomTransition = ZoomTransition()
            imageDetailViewController?.modalPresentationStyle = .custom
            imageDetailViewController?.transitioningDelegate = zoomTransition
            zoomTransition.duration = 0.3
        }
    }
    
    func didTapImage(sender: UITapGestureRecognizer!) {
        selectedImageView = sender.view as! UIImageView
        
        performSegue(withIdentifier: "ImageDetailSegue", sender: nil)
    }
}
