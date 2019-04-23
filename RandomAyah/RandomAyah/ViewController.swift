//
//  ViewController.swift
//  RandomAyah
//
//  Created by Zaid Pathan on 28/08/18.
//  Copyright © 2018 Zaid Pathan. All rights reserved.
//

import Cocoa
import WebKit
import QuartzCore

class Ayah {
    var surah: Int
    var ayah: Int
    
    init(surah: Int, ayah: Int) {
        self.surah = surah
        self.ayah = ayah
    }
}

class ViewController: NSViewController {
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var surah: NSTextField!
    @IBOutlet weak var verse: NSTextField!
    var randomAyah: Ayah?
    
    let maxAyahInSurah = [
        7,286,200,176,120,165,206,75,129,109,
        123,111,43,52,99,128,111,110,98,135,
        112,78,118,64,77,227,93,88,69,60,
        34,30,73,54,45,83,182,88,75,85,
        54,53,89,59,37,35,38,29,18,45,
        60,49,62,55,78,96,29,22,24,13,
        14,11,11,18,12,12,30,52,52,44,
        28,28,20,56,40,31,50,40,46,42,
        29,19,36,25,22,17,19,26,30,20,
        15,21,11,8,8,19,5,8,8,11,
        11,8,3,9,5,4,7,3,6,3,
        5,4,5,6]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.superview?.wantsLayer = true
        webview.navigationDelegate = self
        view.frame = NSScreen.main?.frame ?? NSRect(x: 0, y: 0, width: 100, height: 100)
        refresh()
    }
    
    @IBAction func visit(_ sender: Any) {
        refresh()
    }
    
    func getRandomAyah() -> Ayah {
        let randomSurah = Int.random(in: 1...113)
        let randomAyah = Int.random(in: 1...maxAyahInSurah[randomSurah])

        let randomAyahObj = Ayah(surah: randomSurah, ayah: randomAyah)
        return randomAyahObj
    }
    
    private func refresh() {
        showRandomAyah()
    }
    
    @IBAction func actionRefresh(_ sender: Any) {
        refresh()
    }
    
    private func showRandomAyah() {
        let randomAyah = getRandomAyah()
//        guard let url = URL(string: "https://www.google.com/") else { return }
        let finalURL = "https://quran.com/\(randomAyah.surah)/\(randomAyah.ayah)"
        print("Final URL: \(finalURL)")
        guard let url = URL(string: finalURL) else { return }
        
        let request = URLRequest(url: url)
        webview.load(request)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
}
