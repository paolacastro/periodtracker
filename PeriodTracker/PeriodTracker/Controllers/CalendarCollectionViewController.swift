//
//  CalendarCollectionViewController.swift
//  PeriodTracker
//
//  Created by Paola Castro on 3/16/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let cellNibName = "DayCell"
private let spinnerCellNibName = "LoadingSpinnerCell"
private let spinnerReuseIdentifier = "SpinnerCell"

class CalendarCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var nums = [String]()
    var fetchingMonths = false
    var nextDate = Date()
    let today = Date()
    let gen = MonthGenerator()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tuple = gen.threeMonthArray(for: today)
        nums = tuple.monthArray
        nextDate = tuple.endingDate
        self.collectionView!.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(UINib(nibName: spinnerCellNibName, bundle: nil), forCellWithReuseIdentifier: spinnerReuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    func moreMonths() {
        fetchingMonths = true
        print("fetching More Months")
        collectionView.reloadSections(IndexSet(integer: 1))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            let tuple = self.gen.threeMonthArray(for: self.nextDate)
            self.nums += tuple.monthArray
            self.nextDate = tuple.endingDate
            self.collectionView.reloadData()
            self.fetchingMonths = false
        }
    }
    // MARK: Scroll View Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.height
        
        if offsetY > contentHeight - frameHeight * 4 {
            if !fetchingMonths {
                moreMonths()
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return nums.count
            
        } else if section == 1 && fetchingMonths{
            return 1
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DayCell
            let label = nums[indexPath.row]
            cell.dayLabel.text = label
            if let day = Int(label) {
                if day < 6 {
                    cell.circle.backgroundColor = .red
                }
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spinnerReuseIdentifier, for: indexPath) as! LoadingSpinnerCell
            return cell
        }
    }

}
