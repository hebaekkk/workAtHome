//
//  HomeViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import UIKit
import SnapKit
import Alamofire

protocol HomeViewDelegate {
    func passUUIDandApplyId(uuid: HTTPHeaders, applyId: Int)
}


class HomeViewController: UIViewController {

    //MARK : Delegate
    var delegate: HomeViewDelegate?
    
    //MARK : url Comm.
    let url = "http://192.168.0.11:3000/customer/apply/list"
    let headers: HTTPHeaders = ["Authorization" : "2f2f74c5-64cd-4f2c-bab5-fb9fb0d115d0"]
    var receivedList = [ApplyInfo]()
    var reviewSendData: ApplyInfo?
    
    //MARK : View Components
    let table = UITableView()
    
    
    
    //MARK : Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        fetch()
        tableSetting()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK : View Setting()
    func tableSetting() {
        view.addSubview(table)
        table.snp.makeConstraints{ make in
            make.leading.equalTo(view)
            make.top.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView(frame: .zero)
        
        //table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 130
        
        table.register(ProgressWaitingCell.self, forCellReuseIdentifier: ProgressWaitingCell.identifier)
        table.register(ProgressWillCell.self, forCellReuseIdentifier: ProgressWillCell.identifier)
        table.register(ProgressCompleteCell.self, forCellReuseIdentifier: ProgressCompleteCell.identifier)
        table.register(ProgressZeroCell.self, forCellReuseIdentifier: ProgressZeroCell.identifier)
    }
    


}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let vc = EstimationDetailViewController()
        vc.applyId = receivedList[indexPath.row].applyID
        vc.cleanKind = receivedList[indexPath.row].clnType.rawValue
        vc.header = self.headers
        
        //delegate?.passUUIDandApplyId(uuid: self.headers, applyId: self.receivedList[indexPath.row].applyID)
        
        navigationController?.pushViewController(vc , animated: true)
    }
    
}
extension HomeViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let waitingCell = tableView.dequeueReusableCell(withIdentifier: ProgressWaitingCell.identifier) as? ProgressWaitingCell
        let willCell = tableView.dequeueReusableCell(withIdentifier: ProgressWillCell.identifier) as? ProgressWillCell
        let completeCell = table.dequeueReusableCell(withIdentifier: ProgressCompleteCell.identifier) as? ProgressCompleteCell
        
        let zeroCell = tableView.dequeueReusableCell(withIdentifier: ProgressZeroCell.identifier) as? ProgressZeroCell
    
        let status = receivedList[indexPath.row].stat.rawValue
        
//        if status == "waiting" {
//            waitingCell?.commonInit(with: receivedList[indexPath.row])
//            return waitingCell!
//        } else if status == "tobe" {
//
//        } else
        
        
        
        switch status {
        case "waiting":
            waitingCell?.commonInit(with: receivedList[indexPath.row])

            return waitingCell!
            
        case "tobe":
            willCell?.commonInit(with: receivedList[indexPath.row])
            
            return willCell!
        case "done":
            let isReview = receivedList[indexPath.row].review
            if isReview == 1 {
                completeCell?.commonInit(with: receivedList[indexPath.row])
                self.reviewSendData = receivedList[indexPath.row]
                completeCell?.reviewButton.addTarget(self, action: #selector(moveReviewWrite), for: .touchUpInside)
                completeCell?.reviewButtonTag = 1
                
                return completeCell!
            } else {
                completeCell?.commonInit(with: receivedList[indexPath.row])
                self.reviewSendData = receivedList[indexPath.row]
                completeCell?.reviewButton.addTarget(self, action: #selector(moveReviewWrite), for: .touchUpInside)
                completeCell?.reviewButtonTag = 0
                return completeCell!
            }
        case "timeover":
            zeroCell?.commonInit(with: receivedList[indexPath.row])
            return zeroCell!

        default:
            return completeCell!
        }
        
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    @objc func moveReviewWrite() {
        let vc = ReviewWriteViewController()
        let data = self.reviewSendData
        vc.cleanString = (data?.clnType.returnString())! + " - " + (data?.clnTypeDetail.detailClean)!
        
        vc.dateLabel.text = data?.clnDate
        vc.businessLabel.text = data?.teamName
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController {
    private func fetch() {
        DispatchQueue.main.async {
            self.jsonDecoding()
        }
    }
    
    func jsonDecoding() {
        AF.request(url,
                   parameters: nil,
                   headers: self.headers).responseJSON{ (response) in
                    switch response.result {
                    case .success(let res) :
                        do {
                            print("success 입성")
                            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                            let json = try JSONDecoder().decode(ApplyList.self, from: jsonData)
                            
                            print(json)
                            self.receivedList = json.rows
                            
                            DispatchQueue.main.async {
                                self.table.reloadData()
                                
                            }
                            
                        } catch(let err) {
                            print(err.localizedDescription)
                        }
                    case .failure(let err) :
                        print(err.localizedDescription)
                    }
                   }
        
    }
}
