//
//  ViewController.swift
//  viewDidLoad
//
//  Created by Freda Cheng on 2020/8/30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
       
        //建立遮照圖片
        let imageView = UIImageView(frame: CGRect(x: 70, y: 150, width: 300, height: 300))
        imageView.image = UIImage(named:"MAC")
        imageView.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
        let macView = UIView(frame: imageView.frame)
        
        //建立漸層
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.frame = macView.frame
        gradiantLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        macView.layer.addSublayer(gradiantLayer)
        macView.mask = imageView
        view.addSubview(macView)
      
        //音效
        let fileURL = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        let playItem = AVPlayerItem(url: fileURL)
        player.replaceCurrentItem(with: playItem)
        player.play()
        
        
        //漢堡粒子
        let hambergerCell = CAEmitterCell()
        hambergerCell.contents = UIImage(named: "hamberger")?.cgImage
        hambergerCell.birthRate = 1.5
        hambergerCell.lifetime = 30
        hambergerCell.velocity = 300
        hambergerCell.yAcceleration = 50
        hambergerCell.scale = 0.3
        hambergerCell.spin = 0.5
        hambergerCell.spinRange = 3
        hambergerCell.emissionRange = CGFloat.pi
        
        //薯條粒子
        let friesCell = CAEmitterCell()
        friesCell.contents = UIImage(named: "fries")?.cgImage
        friesCell.birthRate = 0.5
        friesCell.lifetime = 30
        friesCell.velocity = 150
        friesCell.yAcceleration = 40
        friesCell.scale = 0.2
        friesCell.spin = 0.7
        friesCell.spinRange = 2
        friesCell.emissionRange = CGFloat.pi
        
        //雞塊粒子
        let chickenCell = CAEmitterCell()
        chickenCell.contents = UIImage(named: "chicken")?.cgImage
        chickenCell.birthRate = 1
        chickenCell.lifetime = 30
        chickenCell.velocity = 100
        chickenCell.yAcceleration = 50
        chickenCell.scale = 0.2
        chickenCell.spin = 0.5
        chickenCell.spinRange = 1
        chickenCell.emissionRange = CGFloat.pi
        
        //食物雨
        let foodRain = CAEmitterLayer()
        foodRain.emitterCells = [hambergerCell, friesCell, chickenCell]
        foodRain.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        foodRain.emitterSize = CGSize(width: view.bounds.width, height: 0)
        foodRain.emitterShape = .line
        
        view.layer.addSublayer(foodRain)
        view.backgroundColor = .clear
        
    }
    
}

