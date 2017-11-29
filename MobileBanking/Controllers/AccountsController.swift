//
//  AccountsController.swift
//  MobileBanking
//
//  Created by Andrew Webber on 11/19/17.
//  Copyright © 2017 Andrew Webber. All rights reserved.
//

import UIKit
import Firebase

class AccountsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //setting array
    var accountArray: [AccountStr] = []
    @IBOutlet weak var lbltest: UILabel!
    let ref = Database.database()
    
    @IBOutlet weak var tableView: UITableView!
    
    //setting current user
    var currentUser = Auth.auth().currentUser!
    
    override func viewDidLoad() {
        //lbltest.text = "sup"
        ref.reference(withPath: "accounts/\(currentUser.uid)").queryOrdered(byChild: "accountName").observe(.value, with:
            { snapshot in
                var fireAccountArray: [AccountStr] = []
                
                for fireAccount in snapshot.children {
                    let fireAccount = AccountStr(snapshot: fireAccount as! DataSnapshot)
                    fireAccountArray.append(fireAccount)
                }
            
            self.accountArray = fireAccountArray
            self.tableView.reloadData()
        })
        
        super.viewDidLoad()
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let accountCell = tableView.dequeueReusableCell(withIdentifier: "accountTable", for: indexPath) as! AccountTableViewCell
        let account = self.accountArray[indexPath.row]
        accountCell.lblAccount?.text = "hello"//account.aName!
        accountCell.lblAmount?.text = String(format: "$%.02f", account.amount)//account.amount
        //lbltest.text = "hello" //accounts.aName

        return accountCell

    }

    
    //@IBOutlet weak var btnLogout: UIBarButtonItem!
    
    @IBAction func btnLogout_TouchUpInside(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //dismiss(animated: true, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
            self.present(vc!, animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
        
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
