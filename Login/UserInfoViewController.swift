//
//  UserInfoViewController.swift
//  Login
//
//  Created by Aleksandr on 09.10.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = user.person.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.user = user
    }

   

}
