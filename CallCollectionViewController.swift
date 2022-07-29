//
//  CallCollectionViewController.swift
//  CallEmergenciesApp
//
//  Created by Chawan Saeed on 7/20/22.
//  Copyright © 2022 Chawan Saeed. All rights reserved.
//

import UIKit

class CallCollectionViewController: UICollectionViewController, CollectionCellDelegate {

    var phoneNumbers: [ContactNumbers] = [
        ContactNumbers(phoneNumber: "112", contactName: "هێڵی گەرمی فریاکەوتنی نیشتمانی"),
        ContactNumbers(phoneNumber: "122", contactName: "ئامبولانس"),
        ContactNumbers(phoneNumber: "104", contactName: "پۆلیس"),
        ContactNumbers(phoneNumber: "115", contactName: "ئاگرکوژێنەوە"),
        ContactNumbers(phoneNumber: "0533301040", contactName: "منداڵپارێزی كوردستان"),
        ContactNumbers(phoneNumber: "+9647502292525", contactName: "WEO-ڕێکخراوی تواناسازی ژنان")
    ]
    
    // Functions:
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blueColor()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phoneNumbers.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("listOfPhoneNumbers", forIndexPath: indexPath) as! CallCollectionViewCell
        cell.instructionLabel.text = "Tap twice to dial number!"
        cell.callButton.setTitle("\(phoneNumbers[indexPath.row].contactName)", forState: .Normal)
        cell.callButton.backgroundColor = UIColor(red:176.0/255.0, green: 196.0/255.0, blue: 222.0/255.0, alpha: 1)
        cell.callButton.layer.cornerRadius = 65.0
        cell.callButton.clipsToBounds = true
        cell.delegate = self

        return cell
    }
    
     func makeCall(cell: CallCollectionViewCell) {
        if let indexPath = collectionView!.indexPathForCell(cell) {

                    let url: NSURL = NSURL(string: "TEL://\(phoneNumbers[indexPath.row].phoneNumber)")!
                    UIApplication.sharedApplication().openURL(url)
            print("\(phoneNumbers[indexPath.row].phoneNumber)")
        }
    }
}