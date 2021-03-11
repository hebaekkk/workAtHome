//
//  ReviewWriteViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/10.
//

import UIKit
import Photos
import SnapKit
import Cosmos

class ReviewWriteViewController: UIViewController {
    
    
    //MARK : View Component
    var cleanString: String? = nil
    let cleanKindLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "청소종류"
        return label
    }()
    

    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "2020-16-16"
        return label
    }()
    
    let businessLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "뽀라삐빰 회사"
        label.numberOfLines = 0
        return label
    }()
    
    let starView: CosmosView = {
        let starView = CosmosView()
        starView.rating = 0
        starView.settings.totalStars = 5
        starView.settings.starSize = 40
        starView.tintColor = .red
        return starView
    }()
    
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray.cgColor
        return textView
    }()
    
    let photoView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5802763104, green: 0.5076636672, blue: 0.9121668935, alpha: 1)
        return view
    }()
    
    let cellId = "cellId"
    let imageManager = PHCachingImageManager()
    var photoContens: [PostContent]?
    lazy var registerPhotoCollectionView: PostEditorPhotoCollectionView = {
        let cv = PostEditorPhotoCollectionView()
        cv.collectionView.delegate = self
        cv.collectionView.dataSource = self
        return cv
    }()
    
    let addPhotoButton: UIButton = {
        let b = UIButton()
        let image = UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysTemplate)
        b.tintColor = UIColor.red
        b.setImage(image, for: .normal)
        b.backgroundColor = .white//UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        b.layer.cornerRadius = 15
        b.layer.borderWidth = 2.0
        b.layer.borderColor = UIColor.red.cgColor
        b.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        b.tag = 1
        return b
    }()
    
    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        
        cleanString = "폐기물 - 사업장페기물"
        
        cleanKindLabel.text = cleanString
        
        view.addSubview(cleanKindLabel)
        cleanKindLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(cleanKindLabel.snp.bottom).offset(20)
        }
        
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 0
        
        let howLabel = UILabel()
        howLabel.text = "업체는 어땠나요?"
        howLabel.textColor = .black
        howLabel.font = businessLabel.font
        
        howLabel.backgroundColor = .orange
        
        stackView.addArrangedSubview(businessLabel)
        stackView.addArrangedSubview(howLabel)
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
        }
        
        view.addSubview(starView)
        starView.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(stackView.snp.bottom).offset(20)
            //make.height.equalTo(100)
            //make.width.equalTo(200)
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(starView.snp.bottom).offset(20)
            make.height.equalTo(60)
            make.width.equalTo(300)
        }
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.delegate = self
        textView.isScrollEnabled = false
        
        textViewDidChange(textView)
        
        view.addSubview(photoView)
        photoView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(textView.snp.bottom).offset(30)
            make.height.equalTo(80)
        }
        
        setupPhotoCollection()
        
    }

    func setupPhotoCollection() {
        photoView.addSubview(addPhotoButton)
        photoView.addSubview(registerPhotoCollectionView)
        
        
        photoContens = [PostContent]()
        
        addPhotoButton.snp.makeConstraints{ make in
            make.top.equalTo(self.photoView)
            make.leading.equalTo(self.photoView)
            make.bottom.equalTo(self.photoView)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        addPhotoButton.addTarget(self, action: #selector(photoButtonDidClicked(_:)), for: .touchUpInside)
        
        registerPhotoCollectionView.backgroundColor = .black
        registerPhotoCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(self.photoView)
            make.bottom.equalTo(self.photoView)
            make.leading.equalTo(addPhotoButton.snp.trailing).offset(2)
            make.trailing.equalTo(self.photoView).offset(-2)
        }
    }
    
}
extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        let size = CGSize(width: 300, height: 300)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}

extension ReviewWriteViewController: UICollectionViewDelegate {
}

extension ReviewWriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let content = photoContens?[indexPath.item],
           let asset = content.asset {
            let height: CGFloat = 80
            let width: CGFloat = 80
            return CGSize(width: width, height: height)
        }
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

extension ReviewWriteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoContens?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostEditorPhotoCell
        if let content = photoContens?[indexPath.item],
           let asset = content.asset {
            cell.content = content
            cell.delegate = self
            
            cell.representedAssetIdentitifer = asset.localIdentifier
            
            let pixcelWidth = asset.pixelWidth
            let pixcelHeight = asset.pixelWidth
            let height: CGFloat = 200 - 20
            let width = height * (CGFloat(pixcelWidth) * CGFloat(pixcelHeight))
            let targetSize = CGSize(width: width, height: height)
            imageManager.requestImage(for: asset,
                                      targetSize: targetSize,
                                      contentMode: .aspectFit,
                                      options: nil) { (image, _) in
                if cell.representedAssetIdentitifer == asset.localIdentifier {
                    cell.thumbnailImageView.image = image
                }
            }
        }
        return cell
    }
}

extension ReviewWriteViewController: PostEditorPhotoCellDelegate {
    func deletePhotoCell(_ sender: PostEditorPhotoCell) {
        guard let tappedIndexPath = self.registerPhotoCollectionView.collectionView.indexPath(for: sender) else { return }
        photoContens?.remove(at: tappedIndexPath.item)
        self.registerPhotoCollectionView.collectionView.deleteItems(at: [tappedIndexPath])
    }
    
}

extension ReviewWriteViewController: PostEditorPhotoPickerControllerDelegate {
    func postEditorPhotoPickerController(_ picker: PostEditorPhotoPickerController, didFinishPickingContents contents : [PostContent]?) {
        if let contents = contents {
            photoContens?.append(contentsOf: contents)
            DispatchQueue.main.async {
                if self.photoContens!.count > 1 {
                    self.photoContens?.remove(at: 0)
                    self.registerPhotoCollectionView.collectionView.reloadData()
                }
                self.registerPhotoCollectionView.collectionView.reloadData()
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
}

extension ReviewWriteViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        UIImageWriteToSavedPhotosAlbum(image,
                                       self,
                                       #selector(didFinishedImageSave(_:didFinishedSavingWithError:contextInfo:)),
                                       nil)
        self.dismiss(animated: true, completion: nil)
    }
}

extension ReviewWriteViewController {
    @objc func didFinishedImageSave(_ image: UIImage?, didFinishedSavingWithError error: Error?, contextInfo: UnsafeMutableRawPointer) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 1
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        if fetchResult.count > 0 {
            let asset = fetchResult.object(at: 0)
            let postContent = PostContent(type: .asset)
            postContent.asset = asset
            
            DispatchQueue.main.async {
                self.interSelectedPostContent(content: postContent)
            }
        }
    }
    
    func interSelectedPostContent(content: PostContent) {
        self.insertPostContent(content: content)
    }
    
    func fetchedPostContent() {
        self.registerPhotoCollectionView.collectionView.reloadData()
    }
    
    func insertPostContent(content: PostContent) {
        photoContens?.insert(content, at: 0)
        if let index = photoContens?.firstIndex(of: content) {
            let indexPath = IndexPath(row: index, section: 0)
            registerPhotoCollectionView.collectionView.insertItems(at: [indexPath])
        }
    }
}

extension ReviewWriteViewController {
    @objc func photoButtonDidClicked(_ sender: UIButton) {
        let imagePickerController = PostEditorPhotoPickerController()
        imagePickerController.photoSelectedPostContents = self.photoContens
        
        imagePickerController.selectedPhotoNum = 3
        
        imagePickerController.delegate = self
        
        let navController = UINavigationController(rootViewController: imagePickerController)
        DispatchQueue.main.async {
            self.present(navController, animated: true, completion: nil)
        }
    }
}
