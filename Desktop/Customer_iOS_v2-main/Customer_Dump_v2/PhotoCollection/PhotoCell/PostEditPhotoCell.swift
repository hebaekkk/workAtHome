//
//  PostEditPhotoCell.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/10.
//

import UIKit
import Photos
import SnapKit
protocol EditPhotoProtocol: NSObjectProtocol {
    func editPhoto(postContent: PostContent?) -> Void
}

class PostEditPhotoCell: BaseCell {
    
//    MARK : Value
    weak var delegate: EditPhotoProtocol?
    override var isSelected: Bool {
        didSet {
            blackView.layer.opacity = isSelected ? 0.5 : 0
            photoImageView.layer.borderWidth = isSelected ? 2 : 0
            photoCountLabel.isHidden = isSelected ? false : true
            editButton.isHidden = isSelected ? false : true
        }
    }
    var postContent: PostContent? {
        didSet {
            
        }
    }
    var selectedNumber: Int? {
        willSet(newVal) {
            photoCountLabel.text = String(newVal ?? 0)
        }
    }
    
    let editButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "pencil.circle.fill")?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.isHidden = true
        return button
    }()
    
    @objc func editPhotoAction(sender: UIButton) {
        delegate?.editPhoto(postContent: self.postContent)
    }
    
    let blackView: UIView = {
        let v = UIView()
        v.layer.backgroundColor = UIColor.black.cgColor
        v.layer.opacity = 0
        return v
    }()
    
    let photoCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    var representedAssetIdentifier: String?
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor =  #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor
        return iv
    }()
    
//    MARK : Setup View
    override func setupViews() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints{ make in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        photoImageView.addSubview(blackView)
        blackView.snp.makeConstraints{ make in
            make.top.equalTo(photoImageView)
            make.leading.equalTo(photoImageView)
            make.trailing.equalTo(photoImageView)
            make.bottom.equalTo(photoImageView)
        }
        addSubview(photoCountLabel)
        photoCountLabel.snp.makeConstraints{ make in
            make.center.equalTo(self)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        addSubview(editButton)
        editButton.snp.makeConstraints{ make in
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        editButton.addTarget(self, action: #selector(editPhotoAction(sender:)), for: .touchUpInside)
    }
}

