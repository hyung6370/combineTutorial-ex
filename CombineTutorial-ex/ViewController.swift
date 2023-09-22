//
//  ViewController.swift
//  CombineTutorial-ex
//
//  Created by KIM Hyung Jun on 2023/09/22.
//

import UIKit
import CombineCocoa
import Combine

class ViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var navToNumbersBtn: UIButton!
    @IBOutlet weak var navToNumbersSwiftUIBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navToNumbersBtn
            .tapPublisher
            .sink(receiveValue: {
                print(#fileID, #function, #line, "- ")
                
                #warning("TODO : - numbers로 화면 이동")
                let numbersVC = NumbersViewController.instantiate("Numbers")
                self.navigationController?.pushViewController(numbersVC, animated: true)
            })
            .store(in: &subscriptions)
        
        navToNumbersSwiftUIBtn
            .tapPublisher
            .sink(receiveValue: {
                print(#fileID, #function, #line, "- ")
                
                #warning("TODO : - numbers로 화면 이동")
//                let numbersVC = NumbersSwiftUiViewContainerVC()
//                let numbersVC = SwiftUiContainerVC(swiftUiView: NumbersView())
                let numbersVC = NumbersView().getContainerVC()
//                let myVC = MyView().getContainerVC()
                self.navigationController?.pushViewController(numbersVC, animated: true)
//                self.navigationController?.pushViewController(myVC, animated: true)
            })
            .store(in: &subscriptions)
        
    }


}

