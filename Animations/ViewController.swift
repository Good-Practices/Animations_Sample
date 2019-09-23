//
//  ViewController.swift
//  Animations
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var views: [UIView]!
    
    @IBOutlet weak var firstPriorityConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondPriorityConstraint: NSLayoutConstraint!
    @IBOutlet weak var priorityView: UIView!
    
    let animationManager = AnimationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.animationManager.fadeIn(view: self.views[0])
            self.animationManager.shake(view: self.views[1])
            self.animationManager.fadeInOut(view: self.views[2], isFadeIn: false)
            self.animationManager.animateConstraintByPriority(view: self.priorityView , firstPriorityConstraint: self.firstPriorityConstraint, secondPriorityConstraint: self.secondPriorityConstraint)
            self.animationManager.resize(view: self.views[4], duration: 2, scaleX: 1.5, scaleY: 1.5)
            self.animationManager.changeColor(view: self.views[3], duration: 2, firstColor: .blue, secondColor: .orange)
        }
    }
 
}

