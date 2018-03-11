//
//  VCTransluscentNavBar.swift
//  HidingShowingNavBar
//
//  Created by Glenn Posadas on 3/11/18.
//  Copyright © 2018 Thirty One Digital, Inc. All rights reserved.
//

import GPKit
import UIKit

class VCTransluscentNavBar: UIViewController {

    @objc private func tapped(_ sender: UIButton) {
        let screenWithNavBar = VCWithNavBar()
        self.navigationController?.pushViewController(screenWithNavBar, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        let button = UIButton(type: .custom)
        button.setTitle("Show screen with NavBar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tapped(_:)), for: .touchUpInside)
        button.backgroundColor = .gray
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.hideNavBar()
    }

}
