//
//  PostEditorPhotoCell.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/10.
//

import UIKit
import SnapKit
import Photos

protocol PostEditorPhotoCellDelegate: class  {
    func deletePhotoCell(_ sender: PostEditorPhotoCell)
    
}

class PostEditorPhotoCell: BaseCell {
//    MARK : Component values
    static let identifier = "PostEditorPhotoCell"
    
    var content: PostContent? {
        didSet {
            
        }
    }
    
    var representedAssetIdentitifer: String?
    weak var delegate: PostEditorPhotoCellDelegate?
    
    let thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "star")
        iv.contentMode = .scaleToFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let deletePhotoButton: UIButton = {
        let b = UIButton()
        let image = UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysTemplate)
        b.tintColor = UIColor.white
        b.setImage(image, for: UIControl.State.normal)
        b.contentMode = .scaleToFill
        b.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        b.layer.cornerRadius = 10
        b.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return b
    }()
    override func setupViews() {
        addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.bottom.equalTo(self)
            make.trailing.equalTo(self)
        }

        addSubview(deletePhotoButton)

        deletePhotoButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

        deletePhotoButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
    }

    @objc func deleteAction(_ sender: UIButton){
        delegate?.deletePhotoCell(self)
    }
}
