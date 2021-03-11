//
//  dyLengthCollectionViewCell.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/11.
//

import UIKit

final class dyLengthCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "dyLengthCollectionViewCell"
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = dyLengthCollectionViewCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    private let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    private func setupView() {
        backgroundColor = .black
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(15)
        }
    }
    
    func configure(name: String?) {
        titleLabel.text = name
    }
    
}
