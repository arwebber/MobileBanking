//
//  AccountsController.swift
//  MobileBanking
//
//  Created by Andrew Webber on 11/19/17.
//  Copyright © 2017 Andrew Webber. All rights reserved.
//

import UIKit
import Firebase

class AccountsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
