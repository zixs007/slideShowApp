//
//  secondViewController.swift
//  slideShowApp
//
//  Created by 河崎優人 on 2020/12/22.
//  Copyright © 2020 yuto. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var image:UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uiView.image = image
        
    }
    @IBOutlet weak var uiView: UIImageView!
    
    
    @IBAction func unWind(_ segue:UIStoryboardSegue){
        
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
