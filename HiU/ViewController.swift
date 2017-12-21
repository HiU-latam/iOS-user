//
//  ViewController.swift
//  HiU
//
//  Created by Lady Diana Cortes on 18/09/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var splashView: UIImageView! 
    override func viewDidLoad() {
       super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        splashView.animationRepeatCount=1
        let jeremyGif = UIImage.gif(name: "gif_splash")
        
        
        
        
        // Uncomment the next line to prevent stretching the image
        // imageView.contentMode = .ScaleAspectFit
        // Uncomment the next line to set a gray color.
        // You can also set a default image which get's displayed
        // after the animation
        // imageView.backgroundColor = UIColor.grayColor()
        
        // Set the images from the UIImage
        splashView.animationImages = jeremyGif?.images
        // Set the duration of the UIImage
        splashView.animationDuration = jeremyGif!.duration
        // Set the repetitioncount
        splashView.animationRepeatCount = 1
        // Start the animation
        splashView.startAnimating()


//
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! Login
//        self.present(vc, animated: true, completion: nil)
        
        let viewController:UIViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login")   
        self.present(viewController, animated: false, completion: nil)
//        let storyboard = UIStoryboard(name: "Login", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "Login")
//        self.present(controller, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

