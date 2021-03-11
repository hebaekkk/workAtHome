//
//  EstimationDetailViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/05.
//

import UIKit
import SnapKit
import Alamofire
import PhotoSlider

protocol EstimationDetailViewControllerDelegate {
    func sendCleanKind(cleanKind: String)
}

class EstimationDetailViewController: UIViewController {

    //MARK : url Comm.
    var url = "http://192.168.0.11:3000/customer/apply/detail?apply_id="
    var cleanKind: String?
    var header: HTTPHeaders?
    var applyId: Int?
    var info: DetailApplyInfo?
    
    
    
    //var delegate: EstimationDetailViewControllerDelegate?
    
    // MARK : View Components
    private var scrollView = UIScrollView.init()
    private var contentView = UIView()
    
    var headerViewHeightConstraint: NSLayoutConstraint?
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return view
    }()
    
    
    
    
    //View Data Components
    // COMMON
    let cleanKindLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "청소종류"
        return label
    }()
    
    let detailCleanLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "자세한 청소종류"
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
    
    let addressLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "서울특별시 이건 주소 예제이다 하하하하"
        return label
    }()
    
    let leaveCommentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "제가 하고싶은 말은 이거에요"
        label.numberOfLines = 0
        return label
    }()
    
    let payMethodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "현금? 계좌이체? 현금영수증?"
        return label
    }()
    

    
    //OPTION
    
    let placeInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    let pyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "36평"
        return label
    }()
    
    let roomNumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "방 갯수"
        return label
    }()
    
    let bathRoomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "욕실 갯수"
        return label
    }()
    
    let verandaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "욕실 갯수"
        return label
    }()
    
    let elevatorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "욕실 갯수"
        return label
    }()

    let petLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "반려동물 여부"
        return label
    }()
    
    let kitchenLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "주방 갯수"
        return label
    }()
    
    let carLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "차량"
        return label
    }()
    
    let workerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "작업 요청 인원"
        return label
    }()
    

    let cgComment: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.text = "텍 뷰"
        return textView
    }()
    //let infoView = EstimationInfoContentView()
//
//    let infoView: EstimationInfoContentView = {
//        let view = EstimationInfoContentView()
//
//        return view
//    }()
    
  
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return view
    }()
    // MARK : Life Cycle

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.infoView.cleanKind = self.cleanKind
        //print("EstimationDetailViewController CLEAN Kind : \(self.cleanKind!)")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        //self.infoView.cleanKind = self.cleanKind
        
        setupView()
        fetch()
        
        print("SELF CLEANKIKND : \(self.cleanKind)")
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        self.navigationItem.title = "신청내역"
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        self.scrollView.backgroundColor = #colorLiteral(red: 0.9883388877, green: 0.08913052827, blue: 0.01450992934, alpha: 0.4)
        self.contentView.backgroundColor = #colorLiteral(red: 0.08025730401, green: 0.03083190881, blue: 0.9846408963, alpha: 0.4)
        let heightConstraint = NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = UILayoutPriority.init(200)
        
        
        self.scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        self.view.addConstraints([
          self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
          self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
          self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
          self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
          ])
        
        self.scrollView.addSubview(contentView)
        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
        print(padding)
        self.scrollView.addConstraints([
          self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
          self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -1 * padding),
          self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
          self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
          ])
        
        self.view.addConstraints([
          self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          heightConstraint,
          ])
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        //changed by cleanKind value
        //self.infoView.cleanKind = self.cleanKind
        //print("여기선 뭐지 ? \(self.infoView.cleanKind)")

        infoView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(headerView)
        self.contentView.addSubview(infoView)
        self.headerView.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.top.equalTo(self.contentView.snp.top)
            make.height.equalTo(200)

            make.bottom.equalTo(self.infoView.snp.top).offset(-4)
            //make.width.equalTo(200)
            //make.bottom.equalTo(self.contentView).offset(-100)
        }
        
        //headerViewHeightConstraint =  headerView.constraintsForAnchoringTo(boundsOf: headerView)[0]
        
        self.contentView.addSubview(infoView)
        self.infoView.snp.makeConstraints{ make in
            make.top.equalTo(self.headerView.snp.bottom).offset(4)
            
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.height.equalTo(500)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
        
        
        let basicInfoStackView = UIStackView()
        basicInfoStackView.axis = .vertical
        basicInfoStackView.distribution = .fillEqually
        basicInfoStackView.alignment = .leading
        basicInfoStackView.spacing = 3
        
        
        
        basicInfoStackView.addArrangedSubview(cleanKindLabel)
        basicInfoStackView.addArrangedSubview(detailCleanLabel)
        basicInfoStackView.addArrangedSubview(returnimageAndLabelStack(image: "clock.fill", label: dateLabel))//(dateLabel)
        basicInfoStackView.addArrangedSubview(returnimageAndLabelStack(image: "mappin", label: addressLabel))//(addressLabel)
        
        self.infoView.addSubview(basicInfoStackView)
        
        self.placeInfoView.translatesAutoresizingMaskIntoConstraints = false
        self.infoView.addSubview(self.placeInfoView)
        
        var titleLabels: [String]?
        var labelArr: [UILabel]!
        if self.cleanKind! != nil {
            switch self.cleanKind! {
            case "ts":
                titleLabels = ["평수","방 개수", "욕실 개수","베란다 개수","엘리베이터 여부"]
                labelArr = [self.pyLabel, self.roomNumLabel, self.bathRoomLabel, self.verandaLabel, self.elevatorLabel]
            
            case "jr":
                titleLabels = ["평수","방 개수", "욕실 개수","주방 개수", "반려동물 여부"]
                labelArr = [self.pyLabel, self.roomNumLabel, self.bathRoomLabel, self.kitchenLabel, self.petLabel]
            
            case "pg":
                titleLabels = ["차량", "작업 요청 인원", "엘리베이터 여부"]
                labelArr = [self.carLabel, self.workerLabel, self.elevatorLabel]
            
            case "cg":
                titleLabels = ["평수", "엘리베이터 여부"]//, "철거 내용"]
                labelArr = [self.pyLabel, self.elevatorLabel]
            default:
                print("fail")
            }
        }
        
        let placeStack = UIStackView()
        placeStack.axis = .vertical
        placeStack.distribution = .fillEqually
        placeStack.alignment = .leading
        placeStack.spacing = 3
        
        let num = titleLabels!.count
        for i in 0..<num {
            let component = returnStackView(string: titleLabels![i], label: labelArr[i])
            placeStack.addArrangedSubview(component)
        }
        
        if cleanKind! == "cg" {
            placeStack.addArrangedSubview(cgComment)
        }
        
        placeInfoView.addSubview(placeStack)
        placeStack.snp.makeConstraints{ make in
            make.leading.equalTo(placeInfoView.snp.leading).offset(10)
            make.top.equalTo(placeInfoView.snp.top).offset(10)
            make.trailing.equalTo(placeInfoView.snp.trailing).offset(-10)
            make.bottom.equalTo(placeInfoView.snp.bottom).offset(-10)
        }
        
        
        
        
        basicInfoStackView.snp.makeConstraints{ make in
            make.leading.equalTo(self.infoView.snp.leading).offset(16)
            make.top.equalTo(self.infoView.snp.top).offset(16)
            make.trailing.equalTo(self.infoView.snp.trailing).offset(-16)
            
            //make.height.equalTo(60)
            
            make.bottom.equalTo(self.placeInfoView.snp.top).offset(-10)
        }
        
        
        placeInfoView.snp.makeConstraints{ make in
            make.leading.equalTo(self.infoView.snp.leading).offset(16)
            make.trailing.equalTo(self.infoView.snp.trailing).offset(-16)
            make.top.equalTo(basicInfoStackView.snp.bottom).offset(10)
        }
        
        let commentStack = UIStackView()
        commentStack.axis = .vertical
        commentStack.distribution = .fill
        commentStack.alignment = .leading
        commentStack.spacing = 0
        
        let commentTitle = UILabel()
        commentTitle.text = "요청할 상세 내용 및 추가로 남길 내용"
        commentTitle.font = UIFont.boldSystemFont(ofSize: 14)
        
        commentStack.addArrangedSubview(commentTitle)
        commentStack.addArrangedSubview(leaveCommentLabel)


        self.infoView.addSubview(commentStack)

        commentStack.snp.makeConstraints{ make in
            make.leading.equalTo(self.infoView.snp.leading).offset(16)
            make.trailing.equalTo(self.infoView.snp.trailing).offset(-16)
            make.top.equalTo(placeStack.snp.bottom).offset(20)
        }
        
        let payStack = UIStackView()
        payStack.axis = .vertical
        payStack.distribution = .fill
        payStack.alignment = .leading
        payStack.spacing = 0
        
    
        let payTitle = UILabel()
        payTitle.text = "결제방법"
        payTitle.font = UIFont.boldSystemFont(ofSize: 14)
        
        payStack.addArrangedSubview(payTitle)
        payStack.addArrangedSubview(payMethodLabel)

        
 
        self.infoView.addSubview(payStack)
        
        payStack.snp.makeConstraints{ make in
            make.leading.equalTo(self.infoView.snp.leading).offset(16)
            make.trailing.equalTo(self.infoView.snp.trailing).offset(-16)
            make.top.equalTo(commentStack.snp.bottom).offset(10)
        }
        
    }


    func returnStackView(string: String, label: UILabel) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 10
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.text = string
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(label)
        
        return stackView
    }
    
    func returnimageAndLabelStack(image: String, label: UILabel) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        //stackView.alignment = .leading
        stackView.spacing = 2
        
        let imageView = UIImageView()//(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
        imageView.snp.makeConstraints{ make in
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
        imageView.image = UIImage(systemName: image)
        
        stackView.addArrangedSubview(imageView)
        
        //label.text = "WHWHWHWH"
        stackView.addArrangedSubview(label)
        
        return stackView
    }

}

extension EstimationDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y: CGFloat = scrollView.contentOffset.y
        print(y)
        //let newHeaderViewHeight: CGFloat =
    }
}


extension EstimationDetailViewController: HomeViewDelegate {
    func passUUIDandApplyId(uuid: HTTPHeaders, applyId: Int) {
        self.header = uuid
        self.applyId = applyId
        
        //self.url = self.url + String(describing: applyId)
    }
}

extension EstimationDetailViewController {
    private func fetch() {
        
        DispatchQueue.main.async {
            self.jsonDecoding()
        }
    }
    
    func jsonDecoding() {
        AF.request(url + String(self.applyId!),
                   method: .get,
                   parameters: nil,
                   headers: self.header).responseJSON { (response) in
                    switch response.result {
                    case .success(let res) :
                        do {
                            print("success 입성")
                            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                            let json = try JSONDecoder().decode(DetailApply.self, from: jsonData)
                            
                            print(json)
                            
                            DispatchQueue.main.async { [self] in
                                self.info = json.row
                                //self.cleanKind = self.info?.clnType
                                
                                settingViewInfo(with: self.info!)
                            }
                            
                        } catch(let err) {
                            print(err.localizedDescription)
                        }

                    case .failure(let err) :
                        print(err.localizedDescription)
                        
                    }
                   }
       
    }
    
    func settingViewInfo(with info: DetailApplyInfo) {
        self.cleanKindLabel.text = info.clnType.returnString()
        self.detailCleanLabel.text = info.clnTypeDetail.detailClean
        self.dateLabel.text = info.clnDate!
        self.addressLabel.text = info.addr! + info.addrDetail!
        
        
        //self.detailCleanLabel.text = info.detail
        
        switch self.cleanKind! {
        case "ts":
            self.pyLabel.text = String(describing: info.py!) + " 평"
            self.roomNumLabel.text = String(describing: info.room!) + "개"
            self.bathRoomLabel.text = String(describing: info.bath!) + "개"
            self.verandaLabel.text = String(describing: info.balcony!) + "개"
            self.elevatorLabel.text = info.elevator!
        case "jr":
            self.pyLabel.text = String(describing: info.py!) + " 평"
            self.roomNumLabel.text = String(describing: info.room!) + "개"
            self.bathRoomLabel.text = String(describing: info.bath!) + "개"
            self.kitchenLabel.text = String(describing: info.kitchen!) + "개"
            self.petLabel.text = info.pet!

        case "cg":
            self.pyLabel.text = String(describing: info.py!) + " 평"
            self.elevatorLabel.text = info.elevator!
            //self.cgComment.text = info.de
        case "pg":
            self.carLabel.text = String(describing: info.py!) + " 평"
            self.elevatorLabel.text = info.elevator!
        default:
            print("fail")
            
        }
        
        self.payMethodLabel.text = info.payment!
    }
}
