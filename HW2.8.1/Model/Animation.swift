//
//  Animation.swift
//  HW2.8.1
//
//  Created by Aquesta 's on 19.09.2020.
//
import UIKit

enum AnimationsCases: String {
    case shake
    case pop
    case morph
    case wobble

    var name: String {
        switch self {
        case .shake: return "Потрясем"
        case .pop: return "Похлопаем"
        case .morph: return "Превратим"
        case .wobble: return "Покалебаем"
        }
    }
}

enum AnimationCurveCases: String, CaseIterable {
    case linear
    case spring
    case easeInOut
    case easeOut
    case easeIn
}

class Animation {
    var animationTitle: AnimationsCases = .shake
    var curve = AnimationCurveCases.allCases.randomElement()!
    var duration: CGFloat = 1.0
    var force: CGFloat = 2.0
    var parametrsText: String {
        """
            Animation: \(animationTitle.rawValue)
            Curve: \(curve)
            Duration: \(String(format: "%.2f", duration))
            Force: \(String(format: "%.2f", force))
        """
    }

    func nextAnimation(currentAnimanion: AnimationsCases) {
        animationTitle = currentAnimanion
        curve = AnimationCurveCases.allCases.randomElement()!
        duration = CGFloat.random(in: 1...2)
        force = CGFloat.random(in: 1...3)
    }
}
