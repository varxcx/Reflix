//
//  ViewController.swift
//  Reflix
//
//  Created by Vardhan Chopada on 12/8/22.
//

import UIKit
import Lottie


class ViewController: UIViewController{
    
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet var enterButton: UIButton!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton.backgroundColor = .black
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.layer.cornerRadius = 10
        setupAnimation()
        
    }
    
    
    @IBAction func didTapEnterButt() {

    }
    
    //Setting UP Animation
    private func setupAnimation() {
        animationView.animation = Animation.named("lottie")
        animationView.frame = lottieView.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        lottieView.addSubview(animationView)
        
        
    }
   

    

}


