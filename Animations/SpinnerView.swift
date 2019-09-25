//
//  SpinnerView.swift
//  Animations
//
//  Created by Onur Cantay on 24/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

@IBDesignable
class SpinnerView: UIView {
    override func draw(_ rect: CGRect) {
        let shape = CAShapeLayer()
        
        shape.frame.size = .init(width: rect.width * 0.1, height: rect.width * 0.3)
        shape.anchorPoint = .init(x: 0.5, y: 1)
        
        shape.path = .init(ellipseIn: shape.frame, transform: nil)
        shape.fillColor = UIColor(named: "flatAlizarin")?.cgColor
        
        let replicator = CAReplicatorLayer()
        replicator.instanceCount = 20
        replicator.position = .init(x:  rect.width * 0.5, y: rect.height * 0.5)
        let fullCircle: CGFloat = .pi * 2
        let angle = fullCircle / CGFloat(replicator.instanceCount)
        
        replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        replicator.bounds.size = .init(width: shape.frame.height * .pi, height: shape.frame.height)
        replicator.addSublayer(shape)
        layer.addSublayer(replicator)
    }

}
