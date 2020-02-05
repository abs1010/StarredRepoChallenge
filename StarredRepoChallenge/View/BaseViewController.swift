//
//  BaseViewController.swift
//  iVacina
//
//  Created by Alan Silva on 05/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import Lottie

class BaseViewController: UIViewController {
    
    var animationLoadingView: AnimationView?
    var whiteView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func showLoading(){
        whiteView = UIView(frame: self.view.frame)
        whiteView?.backgroundColor = .white
        self.view.addSubview(whiteView ?? UIView())
        
        self.animationLoadingView = AnimationView()
        
        self.animationLoadingView?.frame = self.view.frame
        self.animationLoadingView?.backgroundColor = .clear
        
        let animation = Animation.named("568-download")
        animationLoadingView?.animation = animation
        animationLoadingView?.loopMode = .loop
        
        whiteView?.addSubview(self.animationLoadingView ?? UIView())
        animationLoadingView?.play()
    }
    
    func hideLoading(){
        
        DispatchQueue.main.async {
            self.whiteView?.removeFromSuperview()
            self.animationLoadingView?.stop()
            self.animationLoadingView?.removeFromSuperview()
        }

        
    }
    
}
