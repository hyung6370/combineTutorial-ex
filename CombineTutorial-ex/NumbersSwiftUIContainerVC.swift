//
//  NumbersSwiftUIContainerVC.swift
//  CombineTutorial-ex
//
//  Created by KIM Hyung Jun on 2023/09/22.
//

import Foundation
import UIKit
import SwiftUI

class SwiftUiContainerVC<SwiftUiView: View>: UIViewController {
    
    let swiftUiView: SwiftUiView
    
    init(swiftUiView: SwiftUiView) {
        self.swiftUiView = swiftUiView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.configureHostingVC()
    }
    
    fileprivate func configureHostingVC() {
        let hostingVC = UIHostingController(rootView: NumbersView())
        hostingVC.view?.translatesAutoresizingMaskIntoConstraints = false
        
        // 자식 뷰로 넣기
        self.addChild(hostingVC)
        self.view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

struct MyView: View {
    
    @State var input: String = ""
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("MyView")
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
    
//    static func getContainerVC() -> UIViewController {
//        return SwiftUiContainerVC(swiftUiView: Self())
//    }
}

struct NumbersView: View {
    
    @StateObject var viewModel = NumbersVM()
    
    @State var input: String = ""
    
    var body: some View {
        VStack(alignment: .trailing) {
            TextField("", text: $viewModel.number1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("", text: $viewModel.number2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("", text: $viewModel.number3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("", text: $viewModel.number4)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            
            Text($viewModel.resultValue.wrappedValue)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
    
//    static func getContainerVC() -> UIViewController {
//        return SwiftUiContainerVC(swiftUiView: Self())
//    }
}

extension View {
    func getContainerVC() -> UIViewController {
        return SwiftUiContainerVC(swiftUiView: self)
    }
}

struct NumbersView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersView()
    }
}
