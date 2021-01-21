//
//  ViewController.swift
//  SlideshowApp
//
//  Created by YashimaMasafumi on 2021/01/17.
//  Copyright © 2021 masa.yashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var img01 :UIImage? = UIImage(named: "img01")
    var img02 :UIImage? = UIImage(named: "img02")
    var img03 :UIImage? = UIImage(named: "img03")
    var imglist :[UIImage]? = []
    var anime :UIImage?
    var count :Int = 0
    
    @IBOutlet weak var ImageView01: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imglist!.append(img01!)
        imglist!.append(img02!)
        imglist!.append(img03!)
        self.count = 0
    }
    
    @IBAction func GoButton(_ sender: Any) {
        if self.count == imglist!.count - 1 {
            self.count = 0
            ImageView01.image = imglist![self.count]
        }
        else{
            self.count += 1
            ImageView01.image = imglist![self.count]
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        if self.count == 0{
            self.count = imglist!.count - 1
            ImageView01.image = imglist![self.count]
        }
        else{
            self.count -= 1
            ImageView01.image = imglist![self.count]
        }
    }
    
    @IBAction func PlayAndStopButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "再生"{
            anime = UIImage.animatedImage(with: imglist!, duration: 2)
            ImageView01.image = anime
            sender.setTitle("停止", for: UIControl.State.normal)
        }
        else if sender.titleLabel?.text == "停止"{
            ImageView01.image = nil
            sender.setTitle("再生", for: .normal)
        }

    }
    
}

