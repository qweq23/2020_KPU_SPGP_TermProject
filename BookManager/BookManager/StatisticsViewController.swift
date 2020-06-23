//
//  StatisticsViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/23.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var isGraphViewShowing = false
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func counterViewTap(_ gesture: UITapGestureRecognizer?) {
      if (isGraphViewShowing) {
        //hide Graph
        UIView.transition(from: graphView,
                          to: counterView,
                          duration: 1.0,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion:nil)
      } else {
        //show Graph
        UIView.transition(from: counterView,
                          to: graphView,
                          duration: 1.0,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
      }
      isGraphViewShowing = !isGraphViewShowing
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
