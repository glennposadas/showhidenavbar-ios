//
//  VCWithNavBar.swift
//  HidingShowingNavBar
//
//  Created by Glenn Posadas on 3/11/18.
//  Copyright © 2018 Thirty One Digital, Inc. All rights reserved.
//

import GPKit
import UIKit

class VCWithNavBar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.showNavBar()
        self.makeNavBarTransparent()
        self.makeNavBarColor(color: .brown, itemsTintColor: .white)
    }
}

