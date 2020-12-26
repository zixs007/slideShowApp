//
//  ViewController.swift
//  slideShowApp
//
//  Created by 河崎優人 on 2020/12/22.
//  Copyright © 2020 yuto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nowIndex:Int = 0
    var timer : Timer!
    let images:[UIImage?] = [
        UIImage(named:("image-3")),UIImage(named:("image-4")),UIImage(named:("image-5"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = image3
        imageView.isUserInteractionEnabled = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let getSecond:secondViewController = segue.destination as! secondViewController
        getSecond.image = imageView.image
        self.present(getSecond, animated: true, completion: nil)
        timer.invalidate()
        timer = nil
        ssButton.setImage(playImage, for: .normal)
        bbButton.isEnabled = true
        ffButton.isEnabled = true
        
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    let selectedimage = UIImage(named: "images")
    
    @IBAction func tapAction(_ sender: Any) {
            performSegue(withIdentifier: "to", sender: nil)
    }
    
    
    let image3 = UIImage(named:("image-3"))
    let image4 = UIImage(named:("image-4"))
    let image5 = UIImage(named:("image-5"))
    
    let pauseImage = UIImage(systemName: "pause.fill")
    let playImage = UIImage(systemName: "play.fill")
    
    var nextIndex:Int = 0

      
    @IBOutlet weak var ssButton: UIButton!
    @IBAction func startButton(_ sender: Any) {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeImages), userInfo:nil , repeats: true)
        ssButton.setImage(pauseImage, for:.normal)
            bbButton.isEnabled = false
            ffButton.isEnabled = false
        }else{
            timer.invalidate()
            timer = nil
            ssButton.setImage(playImage, for: .normal)
            bbButton.isEnabled = true
            ffButton.isEnabled = true
        }
    }
    
    
    @IBOutlet weak var ffButton: UIButton!
    @IBAction func forwardButton(_ sender: Any) {
        if nowIndex == 0 {
            imageView.image = image4
            nowIndex += 1
        }else if nowIndex == 1{
            imageView.image = image5
            nowIndex += 1
        } else{
            imageView.image = image3
            nowIndex = 0
        }
        
    }
    
    @IBOutlet weak var bbButton: UIButton!
    @IBAction func backButton(_ sender: Any) {
        if nowIndex == 0 {
            imageView.image = image5
            nowIndex = 2
        }else if nowIndex == 1 {
            imageView.image = image3
            nowIndex = 0
        }else {
            imageView.image = image4
            nowIndex = 1
        }
    }
    
    
    @objc func changeImages(){
        nowIndex += 1
        if nowIndex == images.count {
            nowIndex = 0
        }
        imageView.image = images[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

