//
//  CoinevonetLog.swift
//  coinevonet
//
//  Copyright © 2019 Coinevo. All rights reserved.
//

import AppKit

class CoinevonetLogController : NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var log: CoinevonetLog {
        get {
            // this is walking down the UI stack.
            // TODO: work out a better way of doing this
            let scroll = self.view.subviews[0] as! NSScrollView
            let clip = scroll.subviews[0] as! NSClipView
            let log = clip.subviews[0] as! CoinevonetLog
            return log
        }
    }

}

protocol Appendable {
    func append(string: String)
}

final class CoinevonetLog : NSTextView, Appendable {
    func append(string: String) {
        self.textStorage?.append(NSAttributedString(string: string + "\n"))
        self.scrollToEndOfDocument(nil)
    }
}
