//
//  ViewController.swift
//  UiGrad
//
//  Created by Sheetal Jain on 25/09/19.
//  Copyright © 2019 Sheetal Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
    }
    
    
    @IBOutlet weak var label: UILabel!
    

    
    var greenGradientColor : Int?
    var redGradientColor : Int?
    var blueGradientColor : Int?
    var redGuessedGradientColor: Int?
    var blueGuessedGradientColor: Int?
    var greenGuessedGradientColor: Int?
    
    var CgreenGradientColor = Int.random(in: 1 ... 255)
    var CredGradientColor = Int.random(in: 1 ... 255)
    var CblueGradientColor = Int.random(in: 1 ... 255)
    var CredGuessedGradientColor = Int.random(in: 1 ... 255)
    var CblueGuessedGradientColor = Int.random(in: 1 ... 255)
    var CgreenGuessedGradientColor = Int.random(in: 1 ... 255)
    
    
    var totalAccuracyPercent: Int?
    @IBAction func Done(_ sender: UIButton, forEvent event: UIEvent) {
        createGuessedGradientLayer()
        calDiff()
        
    }
    @IBOutlet weak var GradientColor: UIView!
    @IBOutlet weak var GuessedGradientColor: UIView!

    @IBAction func GreenGradientColor(_ sender: UISlider){
            greenGradientColor = Int(sender.value)
        }
    @IBAction func BlueGradientColor(_ sender: UISlider) {
            blueGradientColor = Int(sender.value)
    }
    @IBAction func RedGradientColor(_ sender: UISlider){
            redGradientColor = Int(sender.value)
        }
    
    
    @IBAction func RedGuessedGradientColor(_ sender: UISlider){
        redGuessedGradientColor = Int(sender.value)
    }
    @IBAction func BlueGuessedGradientColor(_ sender: UISlider) {
        blueGuessedGradientColor = Int(sender.value)
    }
    @IBAction func GreenGuessedGradientColor(_ sender: UISlider) {
        greenGuessedGradientColor = Int(sender.value)
    }
    
    

    func createGradientLayer() {
        var gradientLayer: CAGradientLayer!
        gradientLayer = CAGradientLayer()
     
        gradientLayer.frame = self.GradientColor.bounds
     
        let colorRight = UIColor(red: CGFloat(Float(self.CredGradientColor ?? 1)/255.0), green: CGFloat(Float(self.CgreenGradientColor ?? 1)/255.0), blue: CGFloat(Float(self.CblueGradientColor ?? 1)/255.0), alpha: 1.0).cgColor
        let colorLeft = UIColor(red: CGFloat(Float(self.CredGuessedGradientColor ?? 1)/255.0), green: CGFloat(Float(self.CgreenGuessedGradientColor ?? 1)/255.0), blue: CGFloat(Float(self.CblueGuessedGradientColor ?? 1)/255.0), alpha: 1.0).cgColor
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [colorRight, colorLeft]
        
        self.GradientColor.layer.addSublayer(gradientLayer)
    }
    
    func createGuessedGradientLayer() {
       var gl: CAGradientLayer!
        gl = CAGradientLayer()
        gl.frame = self.GuessedGradientColor.bounds

        let colorRight = UIColor(red: CGFloat(Float(self.redGradientColor ?? 1)/255.0), green: CGFloat(Float(self.greenGradientColor ?? 1)/255.0), blue: CGFloat(Float(self.blueGradientColor ?? 1)/255.0), alpha: 1.0).cgColor
        let colorLeft = UIColor(red: CGFloat(Float(self.redGuessedGradientColor ?? 1)/255.0), green: CGFloat(Float(self.greenGuessedGradientColor ?? 1)/255.0), blue: CGFloat(Float(self.blueGuessedGradientColor ?? 1)/255.0), alpha: 1.0).cgColor

            gl.colors = [colorRight, colorLeft]
            gl.startPoint = CGPoint(x: 0.0, y: 0.5)
            gl.endPoint = CGPoint(x: 1.0, y: 0.5)
            self.GuessedGradientColor.layer.addSublayer(gl)

    }
    func calDiff(){
        let a:Int = abs((greenGradientColor ?? 0) - (CgreenGradientColor ?? 0))
        let b:Int = abs((redGradientColor ?? 0) - (CredGradientColor ?? 0))
        let c:Int = abs((blueGradientColor ?? 0) - (CblueGradientColor ?? 0))
        let d:Int = abs((greenGuessedGradientColor ?? 0) - (CgreenGuessedGradientColor ?? 0))
        let e:Int = abs((redGuessedGradientColor ?? 0) - (CredGuessedGradientColor ?? 0))
        let f:Int = abs((blueGuessedGradientColor ?? 0) - (CblueGuessedGradientColor ?? 0))
        
        let totalAccuracy: Int =  (a + b + c + d + e + f) / 6
        totalAccuracyPercent = ((255 - totalAccuracy) * 100)/255
        print (totalAccuracyPercent ?? 0)
        self.label.text = "Percentage = \(totalAccuracyPercent ?? 0)"

        
    }

}
