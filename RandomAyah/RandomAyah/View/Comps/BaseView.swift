//
//  BaseView.swift
//  RandomAyah
//
//  Created by Zaid Pathan on 22/04/19.
//  Copyright © 2019 Zaid Pathan. All rights reserved.
//

import Cocoa

class BaseView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wantsLayer = true
        layer?.backgroundColor = NSColor.white.cgColor
    }
}
