//
//  ViewController.swift
//  Concurrency
//
//  Created by Jasmee Sengupta on 30/03/18.
//  Copyright © 2018 Jasmee Sengupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        queue()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func queue() {// 6 levels in Quality of Service
        DispatchQueue.global().async { [unowned self] in
            self.printTask(20, "no qos")
        }
        
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in // why not weak
            self.printTask(20, "userInteractive")
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.printTask(20, "userInitiated")
        }
        
        DispatchQueue.global(qos: .default).async { [unowned self] in
            self.printTask(20, "default")
        }
        
        DispatchQueue.global(qos: .utility).async { [unowned self] in
            self.printTask(20, "utility")
        }
        
        DispatchQueue.global(qos: .background).async { [unowned self] in
            self.printTask(20, "background")
        }
        
        DispatchQueue.global(qos: .unspecified).async { [unowned self] in
            self.printTask(20, "unspecified")
        }
        
        DispatchQueue(label: "myqueue_1")
        //DispatchQueue(label: "myqueue_1", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: self)
    }
    
    func printTask(_ count: Int, _ message: String){
        for i in 1...count {
            print(message, i)
        }
    }

}

extension ViewController {
    
}

//print("🔶", i)
