//
//  LanguageManager.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 12/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import Foundation

class LanguageManager {
    
    static let shared = LanguageManager()
    
    var language: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "LanguageCode")
        }
        
        get {
            if let lang = UserDefaults.standard.string(forKey: "LanguageCode") {
                return lang
            } else {
                return self.language
            }
        }
    }
    
}

extension String {
    var localized: String {
        get {
            let lang = LanguageManager.shared.language
            let path = Bundle.main.path(forResource: lang, ofType: "lproj")
            let bundle = Bundle(path: path!)
            let translatedString = bundle?.localizedString(forKey: self, value: nil, table: nil)
            return translatedString!
        }
    }
}
