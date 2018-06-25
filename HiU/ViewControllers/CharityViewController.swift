//
//  CharityViewController.swift
//  HiU
//
//  Created by Pranshi on 5/18/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit
import Koloda
import pop

class CharityViewController: UIViewController {
    
    // MARK: - Declaration
    
    var navigationBarLabel = UILabel.init()
    var rightBarButtonItem = UIBarButtonItem.init()
    var rightSearchBarButtonItem = UIBarButtonItem.init()
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    var leftBackBarButtonItem = UIBarButtonItem.init()

    @IBOutlet weak var viewDesiredCharity: UIView!
    @IBOutlet weak var labelDesiredCharity: UILabel!
    @IBOutlet weak var viewKolda: CustomKolodaView!
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var labelFavorite: UILabel!
    @IBOutlet weak var buttonNext: UIButton!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        prepareKolodaView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("%@", "CharityViewController - viewWillAppear")
        
        prepareNavigation()
        
        prepareViewDesiredCharity()
        
        
        
        prepareFavorite()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func prepareNavigation() {
        NSLog("%@", "CharityViewController - prepareNavigation")
        
        self.navigationController?.navigationBar.tintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        NSLog("%@", "CharityViewController - prepareNavigation - set tintcolor")
        self.navigationController?.navigationBar.barTintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        if let navigationBar = self.navigationController?.navigationBar {
            NSLog("%@%@", "CharityViewController - prepareNavigation - set tintcolor", navigationBar .isKind(of: CharityViewController.self) ? "Yes" : "No")
            let firstFrame = CGRect(x: (navigationBar.frame.size.width/2) - 80, y:(navigationBar.frame.size.height/2) - 10, width: 160, height:20)
            navigationBarLabel = UILabel(frame: firstFrame)
            navigationBarLabel.text = NSLocalizedString("choose_the_charity", comment: "")
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
        
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem]
    }
    
    func backPressed(sender: UIButton)  {
        NSLog("CharityViewController - backPressed", "")
        self.navigationController?.popViewController(animated: true)
    }
    
    func openRightMenu(sender: UIButton)  {
        NSLog("CharityViewController - openRightMenu", "")
    }
    
    // MARK: - View Desired Charity
    
    func prepareViewDesiredCharity() {
        self.viewDesiredCharity.backgroundColor = UIColor.black
        self.viewDesiredCharity.layer.masksToBounds = false
        self.viewDesiredCharity.layer.shadowColor = UIColor.black.cgColor
        self.viewDesiredCharity.layer.shadowOpacity = 0.5
        self.viewDesiredCharity.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        self.labelDesiredCharity.text = NSLocalizedString("select_the_desired_charity", comment: "")
        self.labelDesiredCharity.textColor = UIColor.white
        self.labelDesiredCharity.font = Fonts.Medium
    }

    // MARK: - View Koloda view
    
    func prepareKolodaView() {
        NSLog("prepareKolodaView %@", viewKolda)
        viewKolda.delegate = self
        viewKolda.dataSource = self
        
        
    }
    
    // MARK: - Prepare favorite
    
    func prepareFavorite() {
        labelFavorite.text = NSLocalizedString("add_to_my_charities", comment: "")
        labelFavorite.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        labelFavorite.font = Fonts.Medium
        
        buttonNext.setTitle(NSLocalizedString("next", comment: ""), for: .normal)
        buttonNext.setTitleColor(Helper.UIColorFromRGB(rgbValue: 0xFFFFFF), for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "Nanami", size: 11)
        buttonNext.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        buttonNext.addTarget(self, action: #selector(openToPaymentDetails), for: .touchUpInside)
    }
    
    func openToPaymentDetails(_ sender:UIButton) {
        NSLog("openToPaymentDetails")
    }
    
    // MARK: - Button Action
    
    @IBAction func openPaymentDetails(_ sender: Any) {
        NSLog("openPaymentDetails", "")
        let charityViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentDetailViewController")
        self.navigationController?.pushViewController(charityViewController, animated: true)
    }
}

extension CharityViewController: KolodaViewDelegate{
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        NSLog("kolodaDidRunOutOfCards", "")
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
    }
}

extension CharityViewController: KolodaViewDataSource{
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 1;
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let view = UIView(frame: koloda.bounds)
        NSLog("koloda - viewForCardAt %@", view)
        
        let overlayImageView = UIImageView(frame: view.bounds)
        overlayImageView.image = UIImage(named:"andres_cepeda")
        view.addSubview(overlayImageView)
        
        let labelCharityName = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 20))
        labelCharityName.text = NSLocalizedString("charity_name", comment: "")
        labelCharityName.textColor = UIColor.white
        labelCharityName.font = UIFont(name: "Nanami", size: 10)
        view.addSubview(labelCharityName)
        
        let buttonAddCharity = UIButton(frame: CGRect(x: view.frame.size.width - 50, y: 10, width: 40, height: 40))
        buttonAddCharity.setImage(UIImage(named:"charity_add"), for: .normal)
        view.addSubview(buttonAddCharity)
 
        let imageViewHiuAppIcon = UIImageView(frame: CGRect(x: view.frame.size.width - 40, y: view.frame.size.height - 40, width: 30, height: 30))
        imageViewHiuAppIcon.image = UIImage(named:"charity_hiu_app_icon")
        view.addSubview(imageViewHiuAppIcon)
        
        let labelLearnMore = UILabel(frame: CGRect(x: 10, y: view.frame.size.height - 20, width: 80, height: 20))
        labelLearnMore.text = NSLocalizedString("learn_more", comment: "")
        labelLearnMore.textColor = UIColor.white
        labelLearnMore.font = UIFont(name: "Nanami", size: 10)
        view.addSubview(labelLearnMore)
        
        
        
        return view
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)![0] as? OverlayView
    }
}
