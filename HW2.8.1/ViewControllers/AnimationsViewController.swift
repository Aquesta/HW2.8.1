//
//  ViewController.swift
//  HW2.8.1
//
//  Created by Aquesta 's on 19.09.2020.
//

import Spring
import UIKit

class AnimationsViewController: UIViewController {
    @IBOutlet var viewOutlet: SpringView!
    @IBOutlet var buttonOutlet: SpringButton!
    @IBOutlet var labelOutlet: SpringLabel!

    var currentAnimation: AnimationsCases = .shake
    let animation = Animation()

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOutlet.setTitle(currentAnimation.name, for: .normal)
    }

    @IBAction func buttonPressedAction() {
        changeAnimation(animation: animation)
    }
}

// MARK: - show and change animations function

extension AnimationsViewController {
    private func changeAnimation(animation: Animation) {
        switch animation.animationTitle {
        case .shake:
            currentAnimation = .pop
            showAnimation(animation)
            viewOutlet.animate()
            animation.nextAnimation(currentAnimanion: currentAnimation)
        case .pop:
            currentAnimation = .morph
            showAnimation(animation)
            viewOutlet.animate()
            animation.nextAnimation(currentAnimanion: currentAnimation)
        case .morph:
            currentAnimation = .wobble
            showAnimation(animation)
            viewOutlet.animate()
            animation.nextAnimation(currentAnimanion: currentAnimation)
        case .wobble:
            currentAnimation = .shake
            showAnimation(animation)
            viewOutlet.animate()
            animation.nextAnimation(currentAnimanion: currentAnimation)
        }
    }

    private func showAnimation(_ animation: Animation) {
        viewOutlet.animation = animation.animationTitle.rawValue
        viewOutlet.curve = animation.curve.rawValue
        viewOutlet.duration = animation.duration
        viewOutlet.force = animation.force
        labelOutlet.text = animation.parametrsText
        buttonOutlet.setTitle(currentAnimation.name, for: .normal)
    }
}
