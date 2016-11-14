//
//  ZoomTransition.swift
//  facebook-demo
//
//  Created by Michael Volovar on 11/11/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class ZoomTransition: BaseTransition {
    var originalImageDetailViewFrame: CGRect!
    
    let window = UIApplication.shared.keyWindow
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {

        let imageDetailViewController = toViewController as! ImageDetailViewController
        let imageDetailView = imageDetailViewController.imageView
        let tabBarViewController = fromViewController as! TabBarViewController
        let newsFeedViewController = tabBarViewController.newsFeedViewController as NewsFeedViewController
        
        let frame = window!.convert(newsFeedViewController.selectedImageView.frame, from: window)
        
        print(frame)
        
//        let tempImageView = newsFeedViewController.selectedImageView
//        window?.addSubview(tempImageView!)
    
        originalImageDetailViewFrame = imageDetailView!.frame
        
        imageDetailView!.frame = CGRect(x: newsFeedViewController.selectedImageView!.frame.origin.x, y: newsFeedViewController.selectedImageView!.frame.origin.y - 64, width: newsFeedViewController.selectedImageView!.frame.width, height: newsFeedViewController.selectedImageView!.frame.height)
        imageDetailViewController.backgroundView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
//            tempImageView?.frame = CGRect(origin: imageDetailView!.frame.origin, size: tempImageView!.image!.size)
            imageDetailView!.frame = self.originalImageDetailViewFrame
            imageDetailViewController.backgroundView.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let imageDetailViewController = fromViewController as! ImageDetailViewController
        let imageDetailView = imageDetailViewController.imageView
        let tabBarViewController = toViewController as! TabBarViewController
        let newsFeedViewController = tabBarViewController.newsFeedViewController as NewsFeedViewController
        
        let frame = window!.convert(newsFeedViewController.selectedImageView.frame, from: window)
        
        print(frame)
        
        UIView.animate(withDuration: duration, animations: {
            imageDetailView!.frame = CGRect(x: newsFeedViewController.selectedImageView!.frame.origin.x, y: newsFeedViewController.selectedImageView!.frame.origin.y - 64, width: newsFeedViewController.selectedImageView!.frame.width, height: newsFeedViewController.selectedImageView!.frame.height)
            imageDetailViewController.backgroundView.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }

}
