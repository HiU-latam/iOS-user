//
//  CustomOverlayView.swift
//  Koloda
//
//  Created by Eugene Andreyev on 7/27/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "overlay_like"
private let overlayLeftImageName = "overlay_skip"

class CustomOverlayView: OverlayView {

    
    @IBOutlet lazy var viewOverlay: UIView! = {
        [unowned self] in
        var view = UIView(frame: self.bounds)
        self.addSubview(view)
        return view
    }()
    
    override var overlayState: SwipeResultDirection?  {
        didSet {
            switch overlayState {
            case .left? :
                viewOverlay.backgroundColor = UIColor.clear
            case .right? :
                viewOverlay.backgroundColor = UIColor.clear
            default:
                viewOverlay.backgroundColor = UIColor.clear
            }
            
        }
    }

}
