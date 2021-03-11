//
//  BusinessDetailInfoViewViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/05.
//

import UIKit
import SnapKit

class BusinessDetailInfoViewViewController: UIViewController {
    //MARK : SnapKit
    let tableView = UITableView()
    
    
    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //MARK : Navigation
        
//        let controller: UIViewController = InfoSlideViewController()
//
//        addChild(controller)
//
//        self.view.addSubview(controller.view)
//
//        let screenWidth = UIScreen.main.bounds.width
//        controller.view.frame = CGRect(x: 0, y: 100, width: screenWidth, height: 300)
//        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        controller.didMove(toParent: self)
    }

    
    //MARK : SetupView
    func setupView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(headCell.self, forCellReuseIdentifier: headCell.identifier)
    }
}

extension BusinessDetailInfoViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: headCell.identifier, for: indexPath) as! headCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
}
