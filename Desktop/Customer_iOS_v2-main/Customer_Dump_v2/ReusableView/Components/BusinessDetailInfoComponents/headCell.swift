//
//  headCell.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/11.
//

import UIKit
import SnapKit

class headCell: UITableViewCell {
    
    private let items: [String] = [
        "또띠아",
        "버터",
        "달걀",
        "치즈볼",
        "쪽파",
        "진미채",
        "참외",
        "케이크",
        "새우",
        "대패삼겹살",
    ]
    
    
//  MARK : View Components
    var collectionView: UICollectionView!
    
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
    let cleanLabel: UILabel = {
        let label = UILabel()
        label.text = "청소 종류"
        return label
    }()
    
    let starLabel: UILabel = {
        let label = UILabel()
        label.text = "star"
        return label
    }()
    
    let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("문자로 상담", for: .normal)
        button.imageView?.image = UIImage(systemName: "message.fill")
        return button
    }()
    
    let phoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("전화로 상담", for: .normal)
        button.imageView?.image = UIImage(systemName: "phone.fill")
        return button
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
        profileImageView.snp.makeConstraints{ make in
            make.width.equalTo(32)
            make.height.equalTo(32)
            make.top.equalTo(12)
            make.leading.equalTo(10)
        }
        profileImageView.layer.cornerRadius = 16
        
        let titleLabelStack = UIStackView()
        titleLabelStack.axis = .vertical
        titleLabelStack.distribution = .fill
        
        titleLabelStack.addArrangedSubview(businessTitle)
        titleLabelStack.addArrangedSubview(cleanLabel)
        
        self.contentView.addSubview(titleLabelStack)
        titleLabelStack.snp.makeConstraints{ make in
            make.leading.equalTo(self.profileImageView.snp.trailing).offset(4)
            make.top.equalTo(12)
        }
        
        setCollectionView()
        
    }
    
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = .zero
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .init(top: 5, left: 16, bottom: 6, right: 16)
        
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .cyan
        collectionView.register(dyLengthCollectionViewCell.self, forCellWithReuseIdentifier: dyLengthCollectionViewCell.identifier)
        
        self.contentView.addSubview(collectionView)
        
        ///[  ]Constraint 적용하고 확인 해줘야돼 현은아
        
        
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

extension headCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dyLengthCollectionViewCell.identifier, for: indexPath) as! dyLengthCollectionViewCell
        cell.configure(name: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dyLengthCollectionViewCell.fittingSize(availableHeight: 45, name: items[indexPath.item])
    }
}
