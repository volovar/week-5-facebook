//
//  ImageDetailViewController.swift
//  facebook-demo
//
//  Created by Michael Volovar on 11/10/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIView!
    var image: UIImage!
    var isDismissed: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isDismissed = false
        
        scrollView.delegate = self
        scrollView.contentSize = imageView.frame.size
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        
        scrollView.addGestureRecognizer(doubleTapGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        imageView.image = image
    }
    
    @IBAction func didPressDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.zoomScale == scrollView.minimumZoomScale && scrollView.contentOffset.y < 0 && !isDismissed {
            backgroundView.alpha = 1 + scrollView.contentOffset.y / 100
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.zoomScale == scrollView.minimumZoomScale && scrollView.contentOffset.y < -50 {
            isDismissed = true
            dismiss(animated: true, completion: nil)
        }
    }
    
    func handleDoubleTap() {
        if scrollView.zoomScale > scrollView.minimumZoomScale {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
}
