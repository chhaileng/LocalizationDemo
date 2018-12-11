//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 12/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLanguage()
     
        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage), name: Notification.Name("languageChanged"), object: nil)
    }
    
    @objc func changeLanguage() {
        label.text = "hello".localized
    }

    @IBAction func khmer(_ sender: Any) {
        LanguageManager.shared.language = "km"
//        refreshStoryboard()
        
        // Notify to other screen that language is changed
        NotificationCenter.default.post(name: Notification.Name("languageChanged"), object: nil)
    }
    
    @IBAction func english(_ sender: Any) {
        LanguageManager.shared.language = "en"
//        refreshStoryboard()
        
        // Notify to other screen that language is changed
        NotificationCenter.default.post(name: Notification.Name("languageChanged"), object: nil)
    }
    
    
    func refreshStoryboard() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateInitialViewController()
        appDelegate.window?.rootViewController = homeVC
    }
    
}

