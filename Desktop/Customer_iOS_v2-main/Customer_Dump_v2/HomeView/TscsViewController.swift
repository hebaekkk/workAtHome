//
//  TscsViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/04.
//

import UIKit

class TscsViewController: UIViewController {

    //MARK : Components
    
    let sections = ["프리미엄업체", "플러스업체"]

    let table = UITableView()
    let searchField: UISearchBar = {
        let searchField = UISearchBar()
        searchField.placeholder = "서비스받으실 위치를 검색해 보세요!"
        
        return searchField
    }()
    
    let floatingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("비교견적", for: .normal)
        button.sizeToFit()
        button.layer.shadowRadius = 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 32
        return button
    }()
    
    
    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = .red
        
        viewSetting()
    }
    
    //MARK : setting
    func viewSetting() {
        view.addSubview(table)
        view.addSubview(searchField)
        searchField.snp.makeConstraints{ make in
            
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(80)
            //make.bottom.equalTo(view.snp.bottom)
        }

        table.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(searchField.snp.bottom)
            //make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        table.delegate = self
        table.dataSource = self
        
        table.tableFooterView = UIView(frame: .zero)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 130
        
        table.register(BusinessTableCell.self, forCellReuseIdentifier: BusinessTableCell.identifier)
        
        view.addSubview(floatingButton)
        
        let viewHeight = self.view.bounds.height
        
        floatingButton.frame = CGRect(x: 285, y: viewHeight - 200, width: 64, height: 64)
    }

    //@objc func
    
}

extension TscsViewController: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BusinessDetailInfoViewViewController()
        navigationController?.pushViewController(vc , animated: true)
    }
}
extension TscsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        let off = scrollView.contentOffset.y
        
        let viewHeight = self.view.bounds.height
        
        floatingButton.frame = CGRect(x: 285, y: off + viewHeight - 200, width: floatingButton.frame.size.width, height: floatingButton.frame.size.height)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTableCell.identifier) as? BusinessTableCell
        
        return cell!
    }
    
    
}
