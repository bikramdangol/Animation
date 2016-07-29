//
//  ViewController.swift
//  Animation
//
//  Created by Bikram Dangol on 7/28/16.
//  Copyright © 2016 AppCoders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var startStopButton: UIButton!
    let MAX_IMAGE_COUNT = 9
    var count = 1
    var isAnimating = false
    var timer:Timer = Timer();
    @IBAction func startStopAnimation(_ sender: UIButton) {
        if isAnimating == true
        {
            timer.invalidate()
            isAnimating = false
            startStopButton.setTitle("Start Animation", for: [])
        }
        else
        {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.changeImage), userInfo: nil, repeats: true)
            isAnimating = true
            startStopButton.setTitle("Stop Animation", for: [])
        }
        
    }
    func changeImage(){
        count += 1
        if count > MAX_IMAGE_COUNT
        {
            count = 1
        }
        imageView.image = UIImage.init(named: "IMG_\(count).jpg")
    }
    
    @IBAction func fadeInPressed(_ sender: AnyObject) {
        imageView.alpha = 0
        UIImageView.animate(withDuration: 1) { 
            self.imageView.alpha = 1
        }    }
    @IBAction func slidInPressed(_ sender: UIButton) {
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        UIImageView.animate(withDuration: 2) { 
            self.imageView.center.x = self.imageView.center.x + 500
        }
    }
    @IBAction func growPressed(_ sender: UIButton) {
        let width = imageView.frame.width
        let height = imageView.frame.height
        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIImageView.animate(withDuration: 3) { 
            self.imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

