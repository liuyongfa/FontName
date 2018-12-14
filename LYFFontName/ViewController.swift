//
//  ViewController.swift
//  LYFFontName
//
//  Created by yongfaliu on 2018/12/14.
//  Copyright © 2018 yongfaliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fontNameArray = [String]()
    
    var savePah: String = {
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first! as NSString
        
        return path.appendingPathComponent("FontName") as String
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printNewFontName()
        saveFontNames()
    }

    fileprivate func readFontNames() -> [String]? {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: savePah))
            let array = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String]
            return array
        } catch {return nil}
    }
    
    fileprivate func saveFontNames() {
        for fontFamilyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
                fontNameArray.append(fontName)
            }
        }

        NSKeyedArchiver.archiveRootObject(fontNameArray, toFile: savePah)
    }
    
    fileprivate func printNewFontName() {
        guard let array = readFontNames() else {
            return
        }
        
        let currentArray = currentFontNames()
        
        for string in currentArray {
            if (!array.contains(string)) {
                print("Add new font name:\n\(string)")
            }
        }
        for string in array {
            if (!currentArray.contains(string)) {
                print("Delete a font name:\n\(string)")
            }
        }
    }
    
    fileprivate func currentFontNames() -> [String] {
        var array = [String]()
        for fontFamilyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
                array.append(fontName)
            }
        }
        return array
    }
}

