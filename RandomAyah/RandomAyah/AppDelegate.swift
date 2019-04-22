//
//  AppDelegate.swift
//  RandomAyah
//
//  Created by Zaid Pathan on 28/08/18.
//  Copyright © 2018 Zaid Pathan. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared.presentationOptions = NSApplication.PresentationOptions.fullScreen
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name.bookmarksTemplate)
            button.action = #selector(printQuote(_:))
        }
    }
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
}

