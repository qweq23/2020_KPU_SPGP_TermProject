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
    
    @IBOutlet weak var bookNumLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update (){
        bookNumLabel.text = "총 \(bookManager.books.count)권의 책을 읽으셨습니다!"
        
        // 월별로 데이터 만들기
        var monthDict: [String: Int] = [
            "01": 0,
            "02": 0,
            "03": 0,
            "04": 0,
            "05": 0,
            "06": 0,
        ]
        
        
        for book in bookManager.books {
            let date = book.userDate.components(separatedBy: ".")
            print(date)
            
            monthDict[date[1]]! += 1
        }
        
        var graphData = [Int]()
        
        graphData.append(monthDict["01"] ?? 0)
        graphData.append(monthDict["02"] ?? 0)
        graphData.append(monthDict["03"] ?? 0)
        graphData.append(monthDict["04"] ?? 0)
        graphData.append(monthDict["05"] ?? 0)
        graphData.append(monthDict["06"] ?? 0)
        
        graphView.setData(data: graphData)
        graphView.setNeedsDisplay()
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
