//
//  ViewController.swift
//  ReferenceCycle
//
//  Created by Mac mini on 2023/01/25.
//

import UIKit

protocol SomeDelegate: AnyObject {
    func didTapThing()
}

class Foo: SomeDelegate {
    init() {
        let vc = ViewController()
        vc.delegate = self
    }
    
    func didTapThing() {
        
    }
}

class ViewController: UIViewController {

//    var delegate: SomeDelegate?
    weak var delegate: SomeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

//                alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { _ in
//         Code above has problem.
//         ViewController references alert, and alert references back ViewController,
//         which results in Strong Reference Cycle

        
        // reference self in weak fashion.
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { [weak self] _ in
            self?.doSomething()
        }))
        present(alert, animated: true)
    }
    private func doSomething() {
        
    }
    
    private var data: Data?
    
    private func getData(string: String, completion: ((Data?) -> Void)) {
        completion(nil)
    }
    
    func foo() {
        
        //        self.getData(string: "") { data in
        //        self.data = data
        // causes memory leak
        // from ViewController, references 'getData', and it references back ViewController -> memory leak
        
        self.getData(string: "") { [weak self] data in
            self?.data = data
        }
    }
}

