//
//  NumbersVM.swift
//  CombineTutorial-ex
//
//  Created by KIM Hyung Jun on 2023/09/22.
//

import Foundation
import Combine
import UIKit

class NumbersVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    // Input - ViewModel로 들어오는 녀석
    @Published var number1: String = ""
    @Published var number2: String = ""
    @Published var number3: String = ""
    @Published var number4: String = ""
    
    
    // output - ViewModel에서 나가는 녀석
    @Published var resultValue: String = ""
    
    lazy var resultPublisher: AnyPublisher<String, Never> = Publishers
        .CombineLatest4($number1, $number2, $number3, $number4)
            .map { textValue1, textValue2, textValue3, textValue4 -> Int in
                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber() + textValue4.getNumber()
            }
            .map { "\($0)"}
            .eraseToAnyPublisher()
    
    init() {
        print(#fileID, #function, #line, "- ")
        
        resultPublisher
            .assign(to: \.resultValue, on: self)
            .store(in: &subscriptions)
        
//        Publishers
//            .CombineLatest4($number1, $number2, $number3, $number4)
//            .map { textValue1, textValue2, textValue3, textValue4 -> Int in
//                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber() + textValue4.getNumber()
//            }
//            .map { "\($0)"}
//            .assign(to: \.resultValue, on: self)
////            .sink(receiveValue: { value in
////                print(#fileID, #function, #line, "- value: \(value)")
////                self.resultValue = value
////            })
//            .store(in: &subscriptions)
    }
}
