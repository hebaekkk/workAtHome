//
//  BusinessDetailInfoViewViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/05.
//

import UIKit

class BusinessDetailInfoViewViewController: UIViewController {

    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //MARK : Navigation
        
        let controller: UIViewController = InfoSlideViewController()
        
        addChild(controller)
        
        self.view.addSubview(controller.view)
        
        let screenWidth = UIScreen.main.bounds.width
        controller.view.frame = CGRect(x: 0, y: 100, width: screenWidth, height: 300)
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        controller.didMove(toParent: self)
    }

}
