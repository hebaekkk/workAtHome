//
//  HorizontalImageButton.swift
//  TSCleaning_PT
//
//  Created by BigHand on 2021/02/26.
//

import UIKit

class HorizontalImageButton: UIView {


    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "questionmark.circle.fill")
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Button"
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        //button.setTitleColor(.black, for: .normal)
        //button.setTitle("버튼", for: .normal)
        //button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 0.5245951414, green: 0.9097836018, blue: 0.6244300604, alpha: 0.7433738426)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    func setupView() {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fill
        hStack.spacing = 3
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(hStack)
        hStack.addArrangedSubview(imageView)
        hStack.addArrangedSubview(label)
        self.addSubview(button)

        
        imageView.snp.makeConstraints{ make in
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        label.snp.makeConstraints{ make in
            make.height.equalTo(18)
            make.width.equalTo(50)
        
        }
        
        hStack.snp.makeConstraints{ make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        
        button.snp.makeConstraints{ make in
            make.leading.equalTo(self.snp.leading)
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        print("clicked")
    }
}
