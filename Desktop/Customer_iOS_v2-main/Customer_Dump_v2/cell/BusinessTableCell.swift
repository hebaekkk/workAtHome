//
//  BusinessTableCell.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/04.
//

import UIKit
import SnapKit

class BusinessTableCell: UITableViewCell {

    static let identifier = "BusinessTableCell"
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let businessTitle: UILabel = {
        let label = UILabel()
        label.text = "업체이름"
        return label
    }()
    let cleanKind: UILabel = {
        let label = UILabel()
        label.text = "청소 종류"
        return label
    }()
    
    let starScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "5.5"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("businessTableCell init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(businessTitle)
        self.contentView.addSubview(cleanKind)
        self.contentView.addSubview(starScoreLabel)
        
        profileImageView.snp.makeConstraints{ make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.leading.equalTo(self.contentView.snp.leading).offset(24)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-40)
        }
        profileImageView.layer.cornerRadius = 30
        
        businessTitle.snp.makeConstraints{ make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.height.equalTo(18)
        }
        
        cleanKind.snp.makeConstraints{ make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalTo(businessTitle.snp.bottom)
            make.height.equalTo(18)
        }
        
        
        
        starScoreLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-24)
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.height.equalTo(18)
        }
        
        let starImage = UIImageView()
        starImage.image = UIImage(systemName: "star.fill")
        starImage.clipsToBounds = true
        
        self.contentView.addSubview(starImage)
        starImage.snp.makeConstraints{ make in
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.top.equalTo(13)
            make.trailing.equalTo(starScoreLabel.snp.leading).offset(-4)
            make.bottom.equalTo(-84)
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
    
    //MARK : For Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }

}
