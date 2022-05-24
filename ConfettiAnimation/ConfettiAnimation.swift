//
//  ConfettiAnimation.swift
//  ConfettiAnimation
//
//  Created by Simranjeet Aulakh on 24/05/22.
//

import UIKit

extension UIViewController {
    
     func addConfettiAnimation() {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: self.view.center.x, y: -20)
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
       // emitter.emitterSize = CGSize(width: self.view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()
        emitter.frame = view.bounds
        view.layer.addSublayer(emitter)
    }

    private func generateEmitterCells() -> [CAEmitterCell] {
    var cells:[CAEmitterCell] = [CAEmitterCell]()
    for index in 0..<16 {
        let cell = CAEmitterCell()
        cell.birthRate = 70
        cell.lifetime = 20
        cell.lifetimeRange = 0
        cell.velocity = 200//CGFloat(getRandomVelocity())
        cell.velocityRange = 0
        cell.emissionLongitude = CGFloat(Double.pi)
        cell.emissionRange = .pi * 2
        cell.spin = 3.5
        cell.spinRange = 0
        cell.color = getNextColor(i: index)
        cell.contents = getNextImage(i: index)
        cell.scaleRange = 0.25
        cell.scale = 0.1
        cells.append(cell)
    }
        return cells
    }
    
    private func getRandomVelocity() -> Double {
        return Double.random(in: 0...1)
    }
    
    private func getNextColor(i: Int) -> CGColor {
        let colors = [UIColor.red,UIColor.blue,UIColor.yellow,UIColor.systemPink,UIColor.brown,UIColor.white,UIColor.purple,UIColor.green,UIColor.cyan,UIColor.darkGray,UIColor.orange,UIColor.red,UIColor.yellow,UIColor.systemBlue,UIColor.systemMint,UIColor.systemTeal,UIColor.systemIndigo]
        return colors.randomElement()!.cgColor
    }
    
    private func getNextImage(i: Int) -> CGImage {
        let images = [UIImage(named: "confetti1"),UIImage(named: "confetti2"),UIImage(named: "confetti3")]
        return (images.randomElement()!!.cgImage)!
    }
}
