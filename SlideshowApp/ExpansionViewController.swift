//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by YashimaMasafumi on 2021/01/24.
//  Copyright © 2021 masa.yashi. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var ExpansionView: UIImageView!
    
    var count :Int = 0
    var imglist :[UIImage]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ExpansionView.image = imglist![self.count]
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
