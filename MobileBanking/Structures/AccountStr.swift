//
//  TableViewCell.swift
//  MobileBanking
//
//  Created by Andrew Webber on 11/28/17.
//  Copyright © 2017 Andrew Webber. All rights reserved.
//

import Foundation
import Firebase

struct AccountStr {
    let aName: String
    let amount: Double
    let ref: DatabaseReference?
    
    init(key: String = "", aName: String, amount: Double) {
        self.aName = aName
        self.amount = amount
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        aName = snapshotValue["aName"] as! String
        amount = snapshotValue["amount"] as! Double
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "aName": aName as Any,
            "amount": amount as Any
        ]
    }
}
