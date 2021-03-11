//
//  PnumChangeViewViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/09.
//

import UIKit
import SnapKit

class PnumChangeViewViewController: UIViewController {

    //MARK : View Component
    let pnumTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        
        textField.placeholder = "새 휴대폰번호입력"
        return textField
    }()
    
    let certificationField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "인증번호 입력"
        return textField
    }()

    var isSend = false
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("인증번호 전송", for: .normal)
        return button
    }()
    
    var pnumBottom: NSLayoutConstraint!
    
    //MARK : Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
    }
    
    //MARK : SET UP View
    func setupView() {
        view.addSubview(pnumTextField)
        view.addSubview(certificationField)
        view.addSubview(button)
        
        pnumTextField.addLeftPadding()
        certificationField.addLeftPadding()
        //view.addSubview(certificationField)
        pnumTextField.snp.makeConstraints{ make in
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(40)
        }
    
        certificationField.snp.makeConstraints{ make in
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).offset(-24)
            make.height.equalTo(0)
            make.top.equalTo(pnumTextField.snp.bottom).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).offset(-24)
            make.height.equalTo(60)
            make.top.equalTo(certificationField.snp.bottom).offset(20)
        }
        
        
        button.addTarget(self, action: #selector(height), for: .touchUpInside)
    }
    
    //MARK :
    @objc func height() {
        self.certificationField.snp.updateConstraints { make in
            make.height.equalTo(40)
        }
    }
    
}
