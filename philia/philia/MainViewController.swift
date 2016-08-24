//
//  MainViewController'.swift
//  philia
//
//  Created by khim ung on 7/30/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, DelegateUIViewController,UINavigationControllerDelegate {
    
    @IBOutlet var overlayView: UIView!
    
    @IBOutlet var logoImage: UIImageView!
    
    private var controllers = [UIViewController]()
    
    private var embeddedViewController: ViewController!
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = overlayView.bounds
            overlayView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMoveToParentViewController(self)
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMoveToParentViewController(nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "lasvegas1.jpg")!)
        
        overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.modalPresentationStyle = .OverCurrentContext
        
        logoImage.image = UIImage(named: "philia1");
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        self.embeddedViewController = storyBoard.instantiateViewControllerWithIdentifier("viewController") as! ViewController
        
        activeViewController = self.embeddedViewController
        
        self.embeddedViewController.delegate = self;

    }
    
    /*
     * Call this from embedded IUViewController when ready to seque to next controller
     */
    func onUserAction(nextController: UIViewController) {
        activeViewController = nextController
        self.navigationController!.setNavigationBarHidden(true, animated:true)
    }
    
    /*
     * This works
     */
    func showInNavigation(nextController: UIViewController) {

        print("Title: \(nextController.restorationIdentifier)")
        
        if("profileController" == nextController.restorationIdentifier) {
            self.navigationController!.setNavigationBarHidden(false, animated:true)
        }
        else {
            self.navigationController!.setNavigationBarHidden(true, animated:true)
        }
        
        self.navigationController?.showViewController(nextController, sender:self)
    }
    
    /* This is not used */
    func disableNavigation() {
        self.navigationController!.setNavigationBarHidden(true, animated:true)
    }

    /*
     * This is not working.
     */
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController,
                              animated: Bool) {
        
        print("navigationController")
        
        if("profileController" == (self.navigationController?.visibleViewController!.restorationIdentifier)!) {
            self.navigationController!.setNavigationBarHidden(false, animated:true)
        }
        else {
            self.navigationController!.setNavigationBarHidden(true, animated:true)
        }
        
    }
}

protocol DelegateUIViewController{
    func onUserAction(nextController: UIViewController)
    
    func showInNavigation(nextController: UIViewController)
    
    func disableNavigation()
}