//
//  ProgressCompleteCell.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import UIKit
import SnapKit

class ProgressCompleteCell: UITableViewCell {
    
    static let identifier = "ProgressCompleteCell"
    
    private var viewModel: ApplyInfo?
    
    
    let view: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    let cleanLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        
        label.text = "청소종류"
        return label
    }()
    
    let detailCleanLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "이사 후 퇴실청소"
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "이 노래 너무 좋아요 매일 들어도 안질릴 것 같을 정도.역시 아이유가 최고!입니다."
        return label
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "2020-10-30"
        return label
    }()
    
    let progressView: ProgressView = {
        let view = ProgressView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.hStack.subviews[2].subviews[0].tintColor = .purple
        view.hStack.subviews[2].subviews[1].tintColor = .purple
        //let label = view.hStack.subviews[1].subviews[1]

        return view
    }()
    
    let detailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("상세보기", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    let reviewButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("후기작성", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        return button
    }()



    
    let warningImageView = UIImageView()
    let warningLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("progressCell init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.contentView.addSubview(view)
        view.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.top.equalTo(contentView.snp.top).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
        }
        
        
        self.view.addSubview(cleanLabel)
        self.view.addSubview(detailCleanLabel)
        self.view.addSubview(date)
        self.view.addSubview(addressLabel)
        self.view.addSubview(progressView)


        cleanLabel.snp.makeConstraints{ make in
            make.leading.equalTo(self.view).offset(12)
            make.top.equalTo(self.view).offset(12)
            make.height.equalTo(22)

        }
        detailCleanLabel.snp.makeConstraints{ make in
            make.leading.equalTo(cleanLabel.snp.trailing).offset(8)
            make.top.equalTo(self.view).offset(12)
            make.height.equalTo(22)
        }
        date.snp.makeConstraints{ make in
            make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(self.view).offset(12)
            make.height.equalTo(22)
        }
        addressLabel.snp.makeConstraints{ make in
            make.leading.equalTo(self.view).offset(12)
            make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(cleanLabel.snp.bottom)//.offset(3)
            make.top.equalTo(detailCleanLabel.snp.bottom)
            make.top.equalTo(date.snp.bottom)
            make.height.equalTo(22)
        }

        progressView.snp.makeConstraints{ make in
            //make.leading.equalTo(self.view).offset(35)
            make.centerX.equalTo(self.view)
            make.trailing.equalTo(self.view).offset(-35)
            make.top.equalTo(addressLabel.snp.bottom).offset(4)
            make.height.equalTo(40)

        }

        warningImageView.image = UIImage(systemName: "info.circle.fill")
        warningLabel.text = "완료까지 최대 3일이 소요됩니다."

        //[  ] setting This warning label And Image


        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 0.3
        buttonStack.distribution = .fillEqually
        buttonStack.backgroundColor = .gray
        buttonStack.layer.borderWidth = 0.3
        buttonStack.layer.borderColor = UIColor.gray.cgColor

        buttonStack.addArrangedSubview(detailButton)
        buttonStack.addArrangedSubview(reviewButton)

        self.view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints{ make in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)//.offset(-24)
            make.bottom.equalTo(self.view)
            make.height.equalTo(30)
            //make.top.equalTo(progressView.snp.bottom).offset(10)
        }

//
//        self.view.addSubview(detailButton)
//        detailButton.snp.makeConstraints{ make in
//            make.leading.equalTo(self.view)
//            make.trailing.equalTo(self.view)
//            make.height.equalTo(30)
//            make.bottom.equalTo(self.view)
//        }
        reviewButton.addTarget(self, action: #selector(reviewControl(_:)), for: .touchUpInside)
        
    }
    
    var reviewButtonTag = 0
    
    @objc func reviewControl(_ sender : UIButton) {
//        if sender.tag == 0 {
//            print("unable")
//        } else {
//            print("able")
//            //sender.titleColor(for: .normal) = UIColor.black.cgColor
//        }
    }
    
    //MARK : For Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ProgressCompleteCell {
    public func commonInit(with viewModel: ApplyInfo) {
        self.cleanLabel.text = viewModel.clnType.returnString()
        
        self.detailCleanLabel.text = viewModel.clnTypeDetail.detailClean
        
        self.addressLabel.text = viewModel.addr
        self.date.text = viewModel.clnDate
        // CHECK Progress
        
        
    }
}
