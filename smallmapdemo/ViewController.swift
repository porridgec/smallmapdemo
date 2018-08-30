//
//  ViewController.swift
//  smallmapdemo
//
//  Created by Hahn.Chan on 2018/8/30.
//  Copyright © 2018 Hahn Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scale: CGFloat = 1.0
    
    @IBOutlet weak var mapScrollView: UIScrollView!
    let mapImageView = UIImageView.init(image: #imageLiteral(resourceName: "line"))

    override func viewDidLoad() {
        super.viewDidLoad()
//        mapScrollView.layer.cornerRadius = 100
        mapScrollView.layer.borderWidth = 2
        mapScrollView.layer.borderColor = UIColor.red.cgColor
        mapScrollView.minimumZoomScale = 0.5;
        mapScrollView.maximumZoomScale = 2.5;
        mapScrollView.contentSize = CGSize.init(width: 2000, height: 2000);
        mapScrollView.contentOffset = CGPoint.init(x: 1000, y: 1000)
        mapScrollView.delegate = self
        
        mapScrollView.addSubview(mapImageView)
        mapImageView.frame.origin = CGPoint.init(x: mapScrollView.contentOffset.x + 100 - mapImageView.frame.size.width + 2.5, y: mapScrollView.contentOffset.y + 100 - mapImageView.frame.size.height)
        
    }
    
    @IBAction func onUpClick(_ sender: Any) {
        mapScrollView.setContentOffset(CGPoint.init(x: mapScrollView.contentOffset.x, y: mapScrollView.contentOffset.y - 5), animated: true)
    }
    
    @IBAction func onLeftClick(_ sender: Any) {
        mapScrollView.setContentOffset(CGPoint.init(x: mapScrollView.contentOffset.x - 5, y: mapScrollView.contentOffset.y), animated: true)
    }
    
    @IBAction func onDownClick(_ sender: Any) {
        mapScrollView.setContentOffset(CGPoint.init(x: mapScrollView.contentOffset.x, y: mapScrollView.contentOffset.y + 5), animated: true)
    }
    
    @IBAction func onRightClick(_ sender: Any) {
        mapScrollView.setContentOffset(CGPoint.init(x: mapScrollView.contentOffset.x + 5, y: mapScrollView.contentOffset.y), animated: true)
    }
    
    @IBAction func onResetClick(_ sender: Any) {
        mapScrollView.setContentOffset(CGPoint.init(x: 1000, y: 1000), animated: true)
    }
    
    @IBAction func onZoomInClick(_ sender: Any) {
//        if scale < 2.5 {
//            print("zoom in")
//            scale += 0.5
//            mapScrollView.setZoomScale(scale, animated: true)
//        } else {
//            print("can't zoom")
//        }
    }
    
    @IBAction func onZoomOutClick(_ sender: Any) {
//        if scale > 0.5 {
//            print("zoom out")
//            scale -= 0.5
//            mapScrollView.setZoomScale(scale, animated: true)
//        } else {
//            print("can't zoom")
//        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImageView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("contentOffset is :\(scrollView.contentOffset)")
    }
    
}

