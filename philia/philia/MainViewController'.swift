//
//  MainViewController'.swift
//  philia
//
//  Created by khim ung on 7/30/16.
//  Copyright © 2016 khim ung. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var overlayView: UIView!
    
    @IBOutlet var logoImage: UIImageView!
    
    @IBOutlet var overlayUIView: UIView!
    
    private var embeddedViewController: ViewController!
    private var birthdayPickerController: BirthdayPickerController!
    
    required init(coder aDecoder: NSCoder) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        self.birthdayPickerController = storyBoard.instantiateViewControllerWithIdentifier("birthdayPickerController") as! BirthdayPickerController

        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "lasvegas.jpg")!)
        
        overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.modalPresentationStyle = .OverCurrentContext
        
        logoImage.image = UIImage(named: "philia");
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        self.embeddedViewController = storyBoard.instantiateViewControllerWithIdentifier("viewController") as! ViewController
        
        
        self.embeddedViewController.setOverlayUIView(overlayUIView)
    }
    
 
    
    let viewControllerIdentifiers = ["viewController", "birthdayPickerController"]  // storyboard identifiers for the child view controllers
    
    /*
    @IBAction func didChangeValue(sender: UISegmentedControl) {
        
        let newController = (storyboard?.instantiateViewControllerWithIdentifier(viewControllerIdentifiers[sender.selectedSegmentIndex]))! as UIViewController
        
        let oldController = childViewControllers.last! as UIViewController
        
        oldController.willMoveToParentViewController(nil)
        addChildViewController(newController)
        newController.view.frame = oldController.view.frame
        
        transitionFromViewController(oldController, toViewController: newController, duration: 0.25, options: .TransitionCrossDissolve, animations:{ () -> Void in
            // nothing needed here
            }, completion: { (finished) -> Void in
                oldController.removeFromParentViewController()
                newController.didMoveToParentViewController(self)
        })
    }
 */
}