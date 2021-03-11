//
//  BusinessSearchViewController.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import UIKit
import SnapKit
import PagingKit

class BusinessSearchViewController: UIViewController {
 
    //MARK : Menu Setting (PagingKit)
    var menuViewController : PagingMenuViewController!
    var contentViewController : PagingContentViewController!
    
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet {
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }
    
    let menuContainerView = UIView()
    
    func setContainerView() {
        self.menuContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuContainerView)
        menuContainerView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view.snp.leading)
            make.top.equalTo(self.view.snp.top)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(80)
        }
        
        
    }
    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuViewController, contentViewController] in
        menuViewController?.reloadData()
        contentViewController?.reloadData()
        self?.firstLoad = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
        }
        else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self
        }
    }
    
    
    //MARK : Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .orange
        navigationController?.navigationBar.isHidden = true
        
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        menuViewController.cellAlignment = .center
        
        dataSource = makeDataSource()
        
    }
    
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)] {
        let menuArray = ["ts","jr","cg","pg"]
        
        return menuArray.map {
            let title = $0
            
            switch title {
            case "ts":
                let vc = TscsViewController()
                return (menu: "특수청소", vc)
            case "jr":
                let vc = JrsnViewController()
                return (menu: "정리수납", vc)
            case "cg":
                let vc = CgViewController()
                return (menu: "철거", vc)
            case "pg":
                let vc = PgmViewController()
                return (menu: "폐기물", vc)
            default:
                let vc = TscsViewController()
                return (menu: "특수청소", vc)
            }
        }
    }
    

}
//Menu Datasource
extension BusinessSearchViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let menuWidth = screenWidth / CGFloat(dataSource.count)
        return menuWidth
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        cell.titleLabel.textColor = .gray
        return cell
    }
    
    
    
}
// Menu Control Delegate
extension BusinessSearchViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)//, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
}

//Content DataSource
extension BusinessSearchViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}
//Content Control Delegate
extension BusinessSearchViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
