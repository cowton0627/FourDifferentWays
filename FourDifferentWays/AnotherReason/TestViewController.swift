//
//  TestViewController.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2023/11/2.
//

//import PlaygroundSupport
import UIKit
import SwiftUI

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        // Your setup code here
//
//        self.view = view
//    }
//
//    PlaygroundPage.current.liveView = MyViewController()
}

//// SwiftUI wrapper for your UIKit View Controller
//struct TestViewControllerView: UIViewControllerRepresentable {
//
//    typealias UIViewControllerType = TestViewController
//
//    func makeUIViewController(context: Context) -> TestViewController {
//        // Return an instance of your UIViewController
//        UIStoryboard(name: "Main", bundle: nil)
//            .instantiateViewController(identifier: "\(TestViewController.self)")
//        as! TestViewController
////        TestViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: TestViewController,
//                                context: Context) {
//        // Update the view controller in response to SwiftUI changes
//    }
//}
//
//// SwiftUI Preview Provider
//struct TestViewControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestViewControllerView()
//    }
//}


//import SwiftUI
//import UIKit

// Your Custom UIView
class MyCustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // Your view setup code here
        backgroundColor = .red
    }
}

//// SwiftUI wrapper for your UIKit View
//struct MyCustomViewRepresentable: UIViewRepresentable {
//    
//    func makeUIView(context: Context) -> MyCustomView {
//        // Return an instance of your UIView
//        MyCustomView()
//    }
//    
//    func updateUIView(_ uiView: MyCustomView, context: Context) {
//        // Update the view in response to SwiftUI changes
//    }
//}
//
//// SwiftUI Preview Provider
//struct MyCustomViewRepresentable_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCustomViewRepresentable()
//            .previewLayout(.sizeThatFits)
//            .padding(10) // Add some padding around the preview if you like
//    }
//}
