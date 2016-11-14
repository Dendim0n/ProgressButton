//
//  ViewController.swift
//  ProgressButton
//
//  Created by 任岐鸣 on 2016/11/11.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnClick: ProgressButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        btnClick.setSubLayer()
        btnClick.commonInit()
//        btnClick.setColor(.green)
    }

    @IBAction func btnClicked(_ sender: ProgressButton) {
        sender.clickedToProgress()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

