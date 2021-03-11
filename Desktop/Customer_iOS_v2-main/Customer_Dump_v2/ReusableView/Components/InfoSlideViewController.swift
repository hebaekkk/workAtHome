//
//  InfoSlideViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/05.
//

import UIKit
import SnapKit
import PagingKit

class InfoSlideViewController: UIViewController {

    //MARK : Menu Setting(PagingKit)
    var menuViewController : PagingMenuViewController!
    var contentViewController : PagingContentViewController!
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
 

}
