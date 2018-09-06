//
//  ViewController.swift
//  RandomAyah
//
//  Created by Zaid Pathan on 28/08/18.
//  Copyright © 2018 Zaid Pathan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var surah: NSTextField!
    @IBOutlet weak var verse: NSTextField!
    
    var surahValue = 1
    var ayahValue = 1
    
    @IBAction func visit(_ sender: Any) {
        let url = URL(string: "https://quran.com/\(surahValue)/\(ayahValue)")
        NSWorkspace.shared.open(url!)
    }
    
    func refresh() {
        surahValue = Int.random(in: 0...113)
        ayahValue = Int.random(in: 0...286)
        
        
        surah.stringValue = "\(surahValue)"
        verse.stringValue = "\(ayahValue)"
    }
    
    @IBAction func actionRefresh(_ sender: Any) {
        refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

