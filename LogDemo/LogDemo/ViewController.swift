//
//  ViewController.swift
//  LogDemo
//
//  Created by hope on 2019/1/9.
//  Copyright © 2019 Haitao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        writeLog()
    }

    func writeLog(){
        for i in 0...5 {
            HTLogTool.logWithTag("startLog"+String(i))
        }
    }
    
    @IBAction func writeAction(_ sender: Any) {
        
        writeLog()
    }
    
}

