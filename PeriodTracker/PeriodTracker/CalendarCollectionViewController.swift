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

let nums: [String] = ["1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8"]

class CalendarCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionView Flow Layout Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(self.collectionView.frame.width/7)
        return CGSize(width: self.collectionView.frame.width/7, height: self.collectionView.frame.width/7)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return nums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DayCell
        
        cell.dayLabel.text = nums[indexPath.row]
        // Configure the cell
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
