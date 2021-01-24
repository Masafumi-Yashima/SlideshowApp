//
//  ViewController.swift
//  SlideshowApp
//
//  Created by YashimaMasafumi on 2021/01/17.
//  Copyright © 2021 masa.yashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //picture
    var img01 :UIImage? = UIImage(named: "img01")
    var img02 :UIImage? = UIImage(named: "img02")
    var img03 :UIImage? = UIImage(named: "img03")
    var imglist :[UIImage]? = []
    //var anime :UIImage?
    var count :Int = 0
    var show_count :Int = 0
    //var animecount :Int = 0
    
    //timer
    var timer :Timer!
    //var timer_sec :Int = 0
    
    //UIparts
    @IBOutlet weak var ImageView01: UIImageView!
    @IBOutlet weak var GoButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imglist!.append(img01!)
        imglist!.append(img02!)
        imglist!.append(img03!)
    }
    
    @objc func slideshow(_ timer :Timer){
        ImageView01.image = imglist![self.count]
        //self.show_count += 1
    }
    
    @IBAction func GoButton(_ sender: Any) {
        if self.count == imglist!.count - 1 {
            ImageView01.image = imglist![self.count]
            self.count = 0
        }
        else{
            ImageView01.image = imglist![self.count]
            self.count += 1
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        if self.count == 0{
            ImageView01.image = imglist![self.count]
            self.count = imglist!.count - 1
        }
        else{
            ImageView01.image = imglist![self.count]
            self.count -= 1
        }
    }
    
    @IBAction func PlayAndStopButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "再生"{
            sender.setTitle("停止", for: UIControl.State.normal)
            GoButton.isEnabled = false
            BackButton.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow(_:)), userInfo: nil, repeats: true)
        }
        else if sender.titleLabel?.text == "停止"{
            sender.setTitle("再生", for: UIControl.State.normal)
            GoButton.isEnabled = true
            BackButton.isEnabled = true
            ImageView01.stopAnimating()
        }

    }
    
}

