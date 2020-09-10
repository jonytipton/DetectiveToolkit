//
//  myTabBarController.swift
//  DetectiveToolkit
//
//  Created by Jonathan Tipton on 9/9/20.
//  Copyright © 2020 Jonathan Tipton. All rights reserved.
//

import UIKit

class myTabBarController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 2;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex;

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
