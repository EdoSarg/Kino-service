//
//  ViewController.swift
//  TVOЁ
//
//  Created by Edgar Sargsyan on 04.09.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPageControl: UIPageControl!
    
    @IBOutlet weak var imageView: UIImageView!
        
    let images: [UIImage] = [UIImage(named: "foto1")!, UIImage(named: "foto2")!]
        var currentImageIndex = 0
        var imageChangeTimer: Timer?
        let imageChangeInterval: TimeInterval = 5.0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            imageView.image = images[currentImageIndex]
            myPageControl.numberOfPages = images.count
            myPageControl.currentPage = currentImageIndex
            startImageChangeTimer()
        }
        
        func startImageChangeTimer() {
            imageChangeTimer = Timer.scheduledTimer(timeInterval: imageChangeInterval, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        }
        
        @objc func changeImage() {
            currentImageIndex = (currentImageIndex + 1) % images.count
            imageView.image = images[currentImageIndex]
            
            myPageControl.currentPage = currentImageIndex
        }
        
        deinit {
            imageChangeTimer?.invalidate()
        }
    }
