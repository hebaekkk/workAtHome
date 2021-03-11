//
//  MoreViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import UIKit

class MoreViewController: UIViewController {
    
    //MARK : View Components
    
    private var scrollView = UIScrollView.init()
    private var contentView = UIView()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let button: verticalButton = {
        let button = verticalButton()
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 100)
        button.label.text = "후기목록"
        return button
    }()
    
    let phoneNumLabel: paddingLabel = {
        let label = paddingLabel()
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "010-1234-5678"
        return label
    }()

    
    let versionLabel: paddingLabel = {
        let label = paddingLabel()
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "현재 버전  "
        return label
    }()
    
    var version = "1.0.2"
    
    let shareLabel: paddingLabel = {
        let label = paddingLabel()
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "앱 공유하기"
        return label
    }()
    
    let withdrawlButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원탈퇴", for: .normal)
        button.titleLabel!.text = "회원탈퇴"
        button.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    
    let signoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.titleLabel!.text = "로그아웃"
        button.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    //MARK : Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationController?.navigationBar.isHidden = true
        
        setupView()
    }
    
    
    func setupView() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        self.scrollView.backgroundColor = #colorLiteral(red: 0.9883388877, green: 0.08913052827, blue: 0.01450992934, alpha: 0.4)
        self.contentView.backgroundColor = #colorLiteral(red: 0.08025730401, green: 0.03083190881, blue: 0.9846408963, alpha: 0.4)
        let heightConstraint = NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = UILayoutPriority.init(200)
        
        
        //self.scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        self.view.addConstraints([
          self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
          self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
          self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
          self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
          ])
        
        self.scrollView.addSubview(contentView)
        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
        print(padding)
        self.scrollView.addConstraints([
          self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
          self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -1 * padding),
          self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
          self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
          ])
        
        self.view.addConstraints([
          self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          heightConstraint,
          ])
        
        let nimLabel = UILabel()
        nimLabel.text = "님의"
        nimLabel.textColor = .black
        nimLabel.font = UIFont.systemFont(ofSize: 20)
        
        contentView.addSubview(idLabel)
        idLabel.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.top.equalTo(contentView.snp.top).offset(50)
            make.width.equalTo(55)
        }

        
        
        contentView.addSubview(nimLabel)
        nimLabel.snp.makeConstraints{ make in
            make.leading.equalTo(self.idLabel.snp.trailing).offset(2)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-24)
            make.top.equalTo(self.contentView.snp.top).offset(50)
        }
        
        contentView.addSubview(button)
        
        button.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView.snp.leading).offset(24)
            make.top.equalTo(self.idLabel.snp.bottom).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(80)
        }
        
        
        
        let subTitle = paddingLabel()
        subTitle.text = "계정 정보"
        subTitle.textColor = .black
        subTitle.font = UIFont.systemFont(ofSize: 14)
        
        let adminStack = UIStackView()
        adminStack.axis = .vertical
        adminStack.distribution = .fill
        
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.right")
        chevron.contentMode = .scaleToFill
        chevron.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        
        adminStack.addArrangedSubview(subTitle)
        adminStack.addArrangedSubview(phoneNumLabel)
        
        phoneNumLabel.backgroundColor = .white

        contentView.addSubview(adminStack)
        adminStack.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.top.equalTo(self.button.snp.bottom).offset(20)
            
        }
        phoneNumLabel.addSubview(chevron)
        chevron.snp.makeConstraints{ make in
            make.centerY.equalTo(phoneNumLabel.snp.centerY)
            make.trailing.equalTo(phoneNumLabel.snp.trailing).offset(-24)
        }
        
        

        
        let pnumTab = UITapGestureRecognizer(target: self, action: #selector(phoneNumberTap(sender:)))
        phoneNumLabel.addGestureRecognizer(pnumTab)
        
        
        
        let appTitle = paddingLabel()
        appTitle.text = "앱 정보"
        appTitle.font = UIFont.systemFont(ofSize: 14)
        //contentView.addSubview(appTitle)
        let appStack = UIStackView()
        appStack.axis = .vertical
        appStack.distribution = .fill
        
        appStack.addArrangedSubview(appTitle)
        appStack.addArrangedSubview(versionLabel)
        appStack.addArrangedSubview(shareLabel)
        shareLabel.backgroundColor = .white
        versionLabel.text! += version
        versionLabel.backgroundColor = .white
        
        contentView.addSubview(appStack)
        appStack.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.top.equalTo(adminStack.snp.bottom).offset(20)
        }
        
        let shareChevron = UIImageView()
        shareChevron.image = UIImage(systemName: "chevron.right")
        shareChevron.contentMode = .scaleToFill
        shareChevron.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        
        shareLabel.addSubview(shareChevron)
        shareChevron.snp.makeConstraints{ make in
            make.centerY.equalTo(shareLabel.snp.centerY)
            make.trailing.equalTo(shareLabel.snp.trailing).offset(-24)
        }
        
        contentView.addSubview(withdrawlButton)
        withdrawlButton.snp.makeConstraints{ make in
            make.top.equalTo(appStack.snp.bottom).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            //make.trailing.equalTo(contentView.snp.trailing)
        }
        contentView.addSubview(signoutButton)
        signoutButton.snp.makeConstraints{ make in
            make.top.equalTo(appStack.snp.bottom).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
        }
        
        let shareTab = UIGestureRecognizer(target: self, action: #selector(shareTap(sender:)))
        shareLabel.addGestureRecognizer(shareTab)
        
    }
    
    @objc func phoneNumberTap(sender: UITapGestureRecognizer) {
        let vc = PnumChangeViewViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("clicked!")
    }

    @objc func shareTap(sender: UITapGestureRecognizer) {
        print("share button clicked !")
//        let items = [versionLabel.text]
//        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
//        present(ac, animated: true, completion: nil)
    }
}
