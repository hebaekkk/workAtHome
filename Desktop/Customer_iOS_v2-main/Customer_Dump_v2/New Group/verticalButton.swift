//
//  verticalButton.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/09.
//

import UIKit

class verticalButton: UIView {

    var label: UILabel = {
        let label = UILabel()
        label.text = "버튼"
        label.font = .boldSystemFont(ofSize: 10)
        return label
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "star")
        return imageView
    }()
    
    
    let view: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        //self.cleanKind = nil
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    func setupView() {
        self.addSubview(view)
        self.addSubview(label)
        
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()//(self.snp.top)
            make.centerX.equalToSuperview()//(self.snp.centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        
        view.layer.cornerRadius = 25
        view.addSubview(imageView)
        imageView.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.view.snp.bottom).offset(10)
        }
        
    }

}
