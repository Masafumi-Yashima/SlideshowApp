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
    var img01 :UIImage? = UIImage(named: "img01.jpg")
    var img02 :UIImage? = UIImage(named: "img02.jpg")
    var img03 :UIImage? = UIImage(named: "img03.jpg")
    var img04 :UIImage? = UIImage(named: "img04.jpg")
    var img05 :UIImage? = UIImage(named: "img05.jpg")
    var img06 :UIImage? = UIImage(named: "img06.jpg")
    var imglist :[UIImage]? = []
    var count :Int = 0
    
    //timer
    var timer :Timer!
    
    //UIparts
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var GoButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imglist!.append(img01!)
        imglist!.append(img02!)
        imglist!.append(img03!)
        imglist!.append(img04!)
        imglist!.append(img05!)
        imglist!.append(img06!)
        ImageView.image = imglist![self.count]
        //self.count += 1
    }
    
    @objc func slideshow(_ timer :Timer){
        if self.count == imglist!.count - 1 {
            self.count = 0
            ImageView.image = imglist![self.count]
        }
        else{
            self.count += 1
            ImageView.image = imglist![self.count]
        }
    }
    
    @IBAction func GoButton(_ sender: Any) {
        if self.count == imglist!.count - 1 {
            self.count = 0
            ImageView.image = imglist![self.count]
        }
        else{
            self.count += 1
            ImageView.image = imglist![self.count]
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        if self.count == 0{
            self.count = imglist!.count - 1
            ImageView.image = imglist![self.count]
        }
        else{
            self.count -= 1
            ImageView.image = imglist![self.count]
        }
    }
    
    @IBAction func PlayAndStopButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "再生"{
            sender.setTitle("停止", for: UIControl.State.normal)
            ImageView.isUserInteractionEnabled = false
            GoButton.isEnabled = false
            BackButton.isEnabled = false
            if self.timer == nil{
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow(_:)), userInfo: nil, repeats: true)
            }
        }
        else if sender.titleLabel?.text == "停止"{
            sender.setTitle("再生", for: UIControl.State.normal)
            ImageView.isUserInteractionEnabled = true
            GoButton.isEnabled = true
            BackButton.isEnabled = true
            ImageView.stopAnimating()
            if self.timer != nil{
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @IBAction func TapImageView(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expansionviewcontroller :ExpansionViewController = segue.destination as! ExpansionViewController
        expansionviewcontroller.count = self.count
        expansionviewcontroller.imglist  = self.imglist
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

