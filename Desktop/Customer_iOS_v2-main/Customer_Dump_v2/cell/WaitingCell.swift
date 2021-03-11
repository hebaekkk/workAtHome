//
//  WaitingCell.swift
//  TSCleaning_PT
//
//  Created by BigHand on 2021/02/26.
//

import UIKit
import SnapKit
//
//struct WaitingCellViewModel {
//    let cleanTitle: BasicEstimationInfo
//    let userID: String
//    let passedDay: Int
//
//}



class WaitingCell: UITableViewCell {
    
    static let identifier = "WaitingCell"
    
    let view: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.purple.cgColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    let cleanLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        label.text = "청소종류"
        return label
    }()
    
    let detailCleanLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "이사 후 퇴실청소"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "2020-10-30"
        return label
    }()

    
    let userLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "0910"
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.text = "이 노래 너무 좋아요 매일 들어도 안질릴 것 같을 정도.역시 아이유가 최고!입니다."
        return label
    }()
    
    var maxPrice: String?
    var minPrice: String?
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "30,000"
        return label
    }()

    
    let callButton: HorizontalImageButton = {
        let button = HorizontalImageButton()
        button.imageView.image = UIImage(systemName: "phone.fill")
        button.label.text = "전화"
        return button
    }()
    

    let completeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("완료", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setTitle("취소", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    var passedDay: Int?
    let passedDayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        //label.text = "3"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        maxPrice = nil
        minPrice = nil
        passedDay = nil
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("waitingCell init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(view)
        view.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            make.top.equalTo(contentView.snp.top).offset(12)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
        }
        
        view.addSubview(cleanLabel)
        view.addSubview(detailCleanLabel)
        //view.addSubview(userLabel)
        //view.addSubview(dateLabel)
        //view.addSubview(addressLabel)
        
        
        cleanLabel.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).offset(12)
            make.top.equalTo(view.snp.top).offset(12)
            make.height.equalTo(14)
        }
        
        detailCleanLabel.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).offset(12)
            make.top.equalTo(cleanLabel.snp.bottom).offset(2)
            
        }
        //CLOCK - DATE
        let clockStack = UIStackView()
        clockStack.axis = .horizontal
        clockStack.distribution = .fill
        clockStack.spacing = 7
        view.addSubview(clockStack)
        
        let clockIcon = UIImageView()
        clockIcon.contentMode = .scaleAspectFit
        clockIcon.clipsToBounds = true
        clockIcon.tintColor = .gray
        clockIcon.image = UIImage(systemName: "clock.fill")
        
        //view.addSubview(clockImage)
        clockIcon.snp.makeConstraints{ make in
            make.width.equalTo(14)
            make.height.equalTo(14)
            //make.leading.equalTo(view.snp.leading).offset(12)
            //make.top.equalTo(detailCleanLabel.snp.bottom).offset(3)
        }
        
        clockStack.addArrangedSubview(clockIcon)
        clockStack.addArrangedSubview(dateLabel)
        
        clockStack.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).offset(12)
            make.top.equalTo(detailCleanLabel.snp.bottom).offset(8)
        }
        
        //ADDRESS
        let addressStack = UIStackView()
        addressStack.axis = .horizontal
        addressStack.distribution = .fill
        addressStack.spacing = 7
        addressStack.alignment = .center
        view.addSubview(addressStack)
        
        let addressIcon = UIImageView()
        addressIcon.contentMode = .scaleAspectFit
        addressIcon.clipsToBounds = true
        addressIcon.tintColor = .gray
        addressIcon.image = UIImage(systemName: "signpost.right.fill")
        
        addressIcon.snp.makeConstraints{ make in
            make.width.equalTo(14)
            make.height.equalTo(14)
        }
        addressStack.addArrangedSubview(addressIcon)
        addressStack.addArrangedSubview(addressLabel)
    
        addressStack.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).offset(12)
            make.top.equalTo(clockStack.snp.bottom).offset(3)
            make.trailing.equalTo(view.snp.trailing).offset(-12)
        }
    
        //PRICE
        let priceStack = UIStackView()
        priceStack.axis = .horizontal
        priceStack.distribution = .fill
        priceStack.spacing = 7
        priceStack.alignment = .center
        view.addSubview(priceStack)
        
        let wonIcon = UIImageView()
        wonIcon.contentMode = .scaleAspectFit
        wonIcon.clipsToBounds = true
        wonIcon.tintColor = .gray
        wonIcon.image = UIImage(systemName: "wonsign.circle.fill")
        wonIcon.snp.makeConstraints{ make in
            make.width.equalTo(14)
            make.height.equalTo(14)
        }
        
        priceStack.addArrangedSubview(wonIcon)
        priceStack.addArrangedSubview(priceLabel)
        //ex
        self.maxPrice = "30,000"
        self.minPrice = "15,000"
        
        priceLabel.text = self.minPrice! + " ~ " + self.maxPrice! + " 원"
        
        priceStack.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).offset(12)
            make.top.equalTo(addressStack.snp.bottom).offset(3)
        }
        
        
        //USER ID
        let userStack = UIStackView()
        userStack.axis = .horizontal
        userStack.distribution = .fill
        userStack.spacing = 4
        userStack.alignment = .center
        view.addSubview(userStack)
        
        let userIcon = UIImageView()
        userIcon.contentMode = .scaleAspectFit
        userIcon.clipsToBounds = true
        userIcon.tintColor = .gray
        userIcon.image = UIImage(systemName: "person.fill")
        userIcon.snp.makeConstraints{ make in
            make.width.equalTo(14)
            make.height.equalTo(14)
        }
        userStack.addArrangedSubview(userIcon)
        userStack.addArrangedSubview(userLabel)
        
        userStack.snp.makeConstraints{ make in
            make.top.equalTo(12)
            make.height.equalTo(14)
            make.trailing.equalTo(-12)
        }
        
        //Passed Day
        passedDay = 3
        passedDayLabel.text = String(passedDay!) + "일 지남"
        view.addSubview(passedDayLabel)
        passedDayLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(-12)
            make.top.equalTo(userStack.snp.bottom).offset(3)
            
        }
        
        
        //Bottom Button Stack
        let bottomButtonStack = UIStackView()
        bottomButtonStack.axis = .horizontal
        bottomButtonStack.distribution = .fillEqually
        
        view.addSubview(bottomButtonStack)
        bottomButtonStack.addArrangedSubview(callButton)
        bottomButtonStack.addArrangedSubview(completeButton)
        bottomButtonStack.addArrangedSubview(cancelButton)
        
        bottomButtonStack.snp.makeConstraints{ make in
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view)
            make.top.greaterThanOrEqualTo(priceStack.snp.bottom).offset(8)
            make.height.equalTo(40)
        }

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
