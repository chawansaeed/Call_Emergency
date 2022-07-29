//
//  CallCollectionViewCell.swift
//  CallEmergenciesApp
//
//  Created by Chawan Saeed on 7/20/22.
//  Copyright © 2022 Chawan Saeed. All rights reserved.
//

import UIKit

protocol CollectionCellDelegate {
    func makeCall(cell: CallCollectionViewCell)
}

class CallCollectionViewCell: UICollectionViewCell {
    
    var delegate: CollectionCellDelegate?

    //Properties:
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var callButton: UIButton!
    
    @IBAction func callButtonTapped(sender: AnyObject) {
        delegate?.makeCall(self)
    }
}
