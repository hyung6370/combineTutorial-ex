//
//  UIVIewController+Ext.swift
//  CombineTutorial-ex
//
//  Created by KIM Hyung Jun on 2023/09/22.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static func instantiate(_ storyboardName: String) -> Self
}

extension StoryBoarded where Self: UIViewController {
    
    static func instantiate(_ storyboardName: String) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}

extension UIViewController: StoryBoarded {}
