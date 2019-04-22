//
//  DesignableWebView.swift
//  RandomAyah
//
//  Created by Zaid Pathan on 22/04/19.
//  Copyright © 2019 Zaid Pathan. All rights reserved.
//

import Foundation
import WebKit

@IBDesignable public class DesignableWebView: WKWebView {
    @IBInspectable public var shadowOffset: CGSize = CGSize.zero {
        didSet {
            layer?.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer?.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0 {
        didSet {
            layer?.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable public var shadowColor: NSColor = NSColor.black {
        didSet {
            layer?.shadowColor = shadowColor.cgColor
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        wantsLayer = true
        shadow = NSShadow()
        layer?.shadowOffset = shadowOffset
        layer?.shadowRadius = shadowRadius
        layer?.shadowOpacity = shadowOpacity
        layer?.shadowColor = shadowColor.cgColor
    }
}
