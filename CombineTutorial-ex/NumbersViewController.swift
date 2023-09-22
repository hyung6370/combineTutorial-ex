//
//  NumbersViewController.swift
//  RxExample
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa

class NumbersViewController: UIViewController {
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!

    @IBOutlet weak var result: UILabel!
    
    var subscriptions = Set<AnyCancellable>()
    
    var viewModel: NumbersVM = NumbersVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰모델에 input 넣어주기
        number1.textPublisher
            .compactMap{ $0 } // 옵셔널 -> String
            .assign(to: \.number1, on: viewModel)
            .store(in: &subscriptions)
        
        number2.textPublisher
            .compactMap{ $0 } // 옵셔널 -> String
            .assign(to: \.number2, on: viewModel)
            .store(in: &subscriptions)
        
        number3.textPublisher
            .compactMap{ $0 } // 옵셔널 -> String
            .assign(to: \.number3, on: viewModel)
            .store(in: &subscriptions)
        
        
        // 뷰모델에서 나오는 데이터 Output (뷰와)바인딩하기
        viewModel.$resultValue
            .compactMap{ $0 } // 옵셔널 -> String
            .assign(to: \.text, on: result)
            .store(in: &subscriptions)
    
        
//        Publishers
//            .CombineLatest3(number1.textPublisher, number2.textPublisher, number3.textPublisher)
//            .map { textValue1, textValue2, textValue3 -> Int in
//                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber()
//            }
//            .map { "\($0)"}
//            .assign(to: \.text, on: result)
////            .sink { value in
////                print(#line, "- value: \(value)")
////            }
//            .store(in: &subscriptions)

        
// Rx 바인딩
//        Observable.combineLatest(number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
//                return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
//            }
//            .map { $0.description }
//            .bind(to: result.rx.text)
//            .disposed(by: disposeBag)
    }
}

extension String? {
    func getNumber() -> Int {
        return Int(self ?? "0") ?? 0
    }
}

extension String {
    func getNumber() -> Int {
        return Int(self ?? "0") ?? 0
    }
}
