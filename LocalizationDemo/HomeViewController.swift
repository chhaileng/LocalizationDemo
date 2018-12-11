//
//  HomeViewController.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 12/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        changeLanguage()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage), name: Notification.Name("languageChanged"), object: nil)
    }
    
    @objc func changeLanguage() {
        welcomLabel.text = "welcome".localized
        self.tabBarController?.tabBar.items![0].title = "home".localized
        self.tabBarController?.tabBar.items![1].title = "settings".localized
    }

}
