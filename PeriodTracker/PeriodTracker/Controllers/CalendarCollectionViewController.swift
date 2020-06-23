//
//  CalendarCollectionViewController.swift
//  PeriodTracker
//
//  Created by Paola Castro on 3/16/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"
private let cellNibName = "DayCell"
private let spinnerCellNibName = "LoadingSpinnerCell"
private let spinnerReuseIdentifier = "SpinnerCell"

class CalendarCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LogViewControllerDelegate, UIScrollViewDelegate {
    func didLog() {
        self.collectionView.reloadData()
    }
    
    let calendar = Calendar.current
    var nums = [Any]()
    var fetchingMonths = false
    var nextDate = Date()
    let today = Date()
    let gen = MonthGenerator()
    
    let realm = try! Realm()
    
    var loggedPeriod: PeriodLogEntry?
    var threshold: Int?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logNav = tabBarController?.viewControllers?[1] as! UINavigationController
        let logVC = logNav.viewControllers[0] as! LogViewController
        logVC.delegate = self
        
        navigationItem.title = "Calendar"
        
        let tuple = gen.threeMonthArray(for: today)
        nums = tuple.monthArray
        nextDate = tuple.endingDate
        self.collectionView!.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(UINib(nibName: spinnerCellNibName, bundle: nil), forCellWithReuseIdentifier: spinnerReuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        if let safeLoggedPeriod = realm.objects(PeriodLogEntry.self).first {
            loggedPeriod = safeLoggedPeriod
        }
        
        self.threshold = self.nums.count - 60
    }
    
    func fetchNextItems() {
        let tuple = gen.threeMonthArray(for: nextDate)
        nums += tuple.monthArray
        nextDate = tuple.endingDate
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleIps = self.collectionView.indexPathsForVisibleItems
        
        for ip in visibleIps {
            if ip.row > self.threshold! {
                fetchNextItems()
                collectionView.reloadData()
                self.threshold! += 90
                return
            }
        }
        
    }
    // MARK: UICollectionView Flow Layout Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/8, height: self.collectionView.frame.width/7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return nums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DayCell
        let label = nums[indexPath.row]
        if let safeDate = label as? Date {
            let day = calendar.component(.day, from: safeDate)
            cell.dayLabel.text = String(day)
            if calendar.isDate(safeDate, inSameDayAs: loggedPeriod!.date) {
                cell.circle.backgroundColor = .red
            }
        } else {
            cell.dayLabel.text = label as? String
        }
        return cell

    }

}
