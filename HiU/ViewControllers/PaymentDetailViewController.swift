//
//  PaymentDetailViewController.swift
//  HiU
//
//  Created by Pranshi on 6/1/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit
import MGCollapsingHeader

class PaymentDetailViewController: UIViewController, MGCollapsingHeaderDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Declaration
    
    var navigationBarLabel = UILabel.init()
    var leftBackBarButtonItem = UIBarButtonItem.init()
    var rightBarButtonItem = UIBarButtonItem.init()
    var rightSearchBarButtonItem = UIBarButtonItem.init()
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    var searchPressed = false
    
    @IBOutlet weak var mgCollapsingHeaderView: MGCollapsingHeaderView!
    @IBOutlet weak var mgCollapsingHeaderViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var imageViewCelebrity: UIImageView!
    @IBOutlet weak var imageViewRankBG: UIImageView!
    @IBOutlet weak var imageViewRank: UIImageView!
    @IBOutlet weak var labelRank: UILabel!
    
    @IBOutlet weak var tableViewMessage: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("%@", "PaymentDetailViewController - viewWillAppear")
        
        prepareNavigation()
        
        
        mgCollapsingHeaderView.delegate = self
        mgCollapsingHeaderView.setCollapsingConstraint(mgCollapsingHeaderViewHeight)
        mgCollapsingHeaderView.addFadingSubview(viewHeader, fadeBy: 0.3)
        
        
        prepareHeader()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationBarLabel.removeFromSuperview()
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func prepareNavigation()  {
        self.navigationController?.navigationBar.tintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        NSLog("%@", "MessageViewController - prepareNavigation - set tintcolor")
        self.navigationController?.navigationBar.barTintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        if let navigationBar = self.navigationController?.navigationBar {
            NSLog("%@", "MessageViewController - prepareNavigation - navigationBar")
            let firstFrame = CGRect(x: (navigationBar.frame.size.width/2) - 80, y:(navigationBar.frame.size.height/2) - 10, width: 160, height:20)
            navigationBarLabel = UILabel(frame: firstFrame)
            navigationBarLabel.text = NSLocalizedString("message", comment: "")
            navigationBarLabel.textColor = UIColor.white
            navigationBarLabel.textAlignment = NSTextAlignment.center
            navigationBarLabel.font = Fonts.Medium
            navigationBar.addSubview(navigationBarLabel)
        }
        
        var leftBackBarButtonImge = UIImage(named: "back_icon")
        leftBackBarButtonImge = leftBackBarButtonImge?.withRenderingMode(.alwaysOriginal)
        leftBackBarButtonItem = UIBarButtonItem.init(
            image: leftBackBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(backPressed))
        
        self.navigationItem.leftBarButtonItem = leftBackBarButtonItem
        
        var rightBarButtonImge = UIImage(named: "charity_vertical_dots")
        rightBarButtonImge = rightBarButtonImge?.withRenderingMode(.alwaysOriginal)
        rightBarButtonItem = UIBarButtonItem.init(
            image: rightBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(openRightMenu))
        
        var rightSearchBarButtonImge = UIImage(named: "charity_search_icon")
        rightSearchBarButtonImge = rightSearchBarButtonImge?.withRenderingMode(.alwaysOriginal)
        rightSearchBarButtonItem = UIBarButtonItem.init(
            image: rightSearchBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(openSearchBar))
        
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem, rightSearchBarButtonItem]
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func backPressed(sender: UIButton)  {
        NSLog("backPressed", "")
        if searchPressed {
            searchPressed = false
            self.navigationItem.rightBarButtonItems = [rightBarButtonItem, rightSearchBarButtonItem]
            self.navigationController?.navigationBar.addSubview(navigationBarLabel)
            
            self.navigationItem.titleView = nil
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func openRightMenu(sender: UIButton)  {
        NSLog("openRightMenu", "")
    }
    
    func openSearchBar(sender: UIButton)  {
        NSLog("openSearchBar", "")
        searchPressed = true
        self.navigationItem.rightBarButtonItems = nil
        self.navigationBarLabel.removeFromSuperview()
        
        searchBar.placeholder = NSLocalizedString("search", comment: "")
        self.navigationItem.titleView = searchBar
        
        
    }
    
    func scrollViewDidScroll(_ scrollView:UIScrollView){
        self.mgCollapsingHeaderView.collapse(withScroll: scrollView)
    }
    
    func headerDidCollapse(toOffset offset: Double) {
        
    }
    
    func headerDidFinishCollapsing() {
        
    }
    
    func headerDidExpand(toOffset offset: Double) {
        
    }
    
    func headerDidFinishExpanding() {
        
    }
    
    func prepareHeader() {
        NSLog("prepareHeader")
        let selectedDashboardModal = Shared.shared.dashboardModalData
        
        imageViewCelebrity.image = UIImage(named: (selectedDashboardModal?.celebrityImage)!)
        imageViewCelebrity.layer.shadowColor = UIColor.black.cgColor
        imageViewCelebrity.layer.shadowOpacity = 1
        imageViewCelebrity.layer.shadowOffset = CGSize.zero
        
        labelName.text = selectedDashboardModal?.celebrityName
        labelCategory.text = selectedDashboardModal?.celebrityCategory
        labelRank.text = selectedDashboardModal?.celebrityRating
        imageViewRankBG.image = UIImage(named: "list_inner_bevel")
        imageViewRank.image = UIImage(named: (selectedDashboardModal?.celebrityRatingImage)!)
    }
    
    //MARK: TABLE VIEW DELEGATION METHODS

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:PaymentDetailsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PaymentDetailsTableViewCell", for: indexPath) as? PaymentDetailsTableViewCell)!
            cell.labelPaymentDetails.text = NSLocalizedString("payment_details", comment: "")
            cell.labelPaymentDetails.font = UIFont(name: "Nanami", size: 16)
            cell.labelPaymentDetails.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            
            cell.labelMessage.text = NSLocalizedString("message", comment: "")
            cell.labelMessage.font = UIFont(name: "Nanami", size: 10)
            
            let messageAmount = 50
            cell.labelMessageAmount.text = "$\(messageAmount)"
            cell.labelMessageAmount.font = UIFont(name: "Nanami", size: 10)
            
            cell.labelCharity.text = NSLocalizedString("charity", comment: "")
            cell.labelCharity.font = UIFont(name: "Nanami", size: 10)
            
            let charityAmount = 5
            cell.labelCharityAmount.text = "$\(charityAmount)"
            cell.labelCharityAmount.font = UIFont(name: "Nanami", size: 10)
            
            cell.labelTotal.text = NSLocalizedString("total", comment: "")
            cell.labelTotal.font = UIFont(name: "Nanami", size: 10)
            
            let totalAmount = messageAmount + charityAmount
            cell.labelTotalAmount.text = "$\(totalAmount)"
            cell.labelTotalAmount.font = UIFont(name: "Nanami", size: 10)
            
            return cell
        }else if indexPath.row == 1 {
            let cell:PaymentCardDetailsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PaymentCardDetailsTableViewCell", for: indexPath) as? PaymentCardDetailsTableViewCell)!
            
            cell.viewCardDetails.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            cell.labelCardNumber.text = NSLocalizedString("card_number", comment: "")
            cell.labelCardNumber.font = UIFont(name: "Nanami", size: 10)
            cell.labelCardNumber.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            
            cell.viewExpDate.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            cell.labelExpDate.text = NSLocalizedString("exp_date", comment: "")
            cell.labelExpDate.font = UIFont(name: "Nanami", size: 10)
            cell.labelExpDate.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            
            cell.viewCVV.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            cell.labelCVV.text = NSLocalizedString("cvv", comment: "")
            cell.labelCVV.font = UIFont(name: "Nanami", size: 10)
            cell.labelCVV.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            
            cell.viewCardName.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            cell.labelCardName.text = NSLocalizedString("name", comment: "")
            cell.labelCardName.font = UIFont(name: "Nanami", size: 10)
            cell.labelCardName.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            
            return cell
        }else if indexPath.row == 2 {
            let cell:PaymentTypeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PaymentTypeTableViewCell", for: indexPath) as? PaymentTypeTableViewCell)!
            
            cell.buttonDone.titleLabel?.text = NSLocalizedString("done", comment: "")
            cell.buttonDone.titleLabel?.font = UIFont(name: "Nanami", size: 10)
            return cell
        }else{
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 126.0
        }else if indexPath.row == 1 {
            return 166.0
        }else if indexPath.row == 2 {
            return 60.0
        }else{
            return 0.0
        }
    }
    
}
