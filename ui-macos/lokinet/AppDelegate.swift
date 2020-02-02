//
//  AppDelegate.swift
//  coinevonet
//
//  Copyright © 2019 Coinevo. All rights reserved.
//

import Cocoa

let LOG_WINDOW_CONTROLLER: NSWindowController = NSWindowController(window: nil)

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var coinevonet: CoinevonetRunner? = nil
    var appender: Appendable? = nil

    var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationWillFinishLaunching(_ notification: Notification) {
        if (!Preferences.firstRunDone) {
            Preferences.firstRunDone = true
            Preferences.restore()
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let statusButton = statusBarItem.button else { return }
        statusButton.title = "CoinevoNet"
        let statusMenu: NSMenu = NSMenu()
        statusMenu.autoenablesItems = false
        statusMenu.addItem(withTitle: "CoinevoNet", action: nil, keyEquivalent: "")

        let runItem: NSMenuItem = {
            let item = NSMenuItem(
                title: "Run",
                action: #selector(runCoinevonet),
                keyEquivalent: "r"
            )
            item.target = self

            return item
        }()

        let stopItem: NSMenuItem = {
            let item = NSMenuItem(
                title: "Stop",
                action: #selector(stopCoinevonet),
                keyEquivalent: "s"

            )
            item.isEnabled = false
            item.target = self

            return item
        }()

        let showWindowItem: NSMenuItem = {
            let item = NSMenuItem(
                title: "Show Window",
                action: #selector(showWindow),
                keyEquivalent: "w"
            )
            item.target = self

            return item
        }()

        let quitApplicationItem: NSMenuItem = {
            let item = NSMenuItem(
                title: "Quit",
                action: #selector(terminate),
                keyEquivalent: "q")
            item.target = self

            return item
        }()

        statusMenu.addItems(
            .separator(),
            runItem,
            stopItem,
            .separator(),
            showWindowItem,
            .separator(),
            quitApplicationItem
        )

        statusBarItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        coinevonet?.stop()
    }
}

extension AppDelegate {
    @objc
    func showWindow(sender: NSMenuItem) {
        if let vc = WindowsManager.getVC(withIdentifier: "CoinevonetLogController", ofType: CoinevonetLogController.self) {
            appender = vc.log
            let window: NSWindow = {
                let w = NSWindow(contentViewController: vc)

                w.styleMask.remove(.fullScreen)
                w.styleMask.remove(.resizable)
                w.styleMask.remove(.miniaturizable)

                w.level = .floating

                return w
            }()

            coinevonet?.logAppender = vc.log

            if LOG_WINDOW_CONTROLLER.window == nil {
                LOG_WINDOW_CONTROLLER.window = window
            }

            LOG_WINDOW_CONTROLLER.showWindow(window)
        }
    }

    @objc
    func runCoinevonet(sender: NSMenuItem) {
        if coinevonet == nil {
            coinevonet = CoinevonetRunner(interface: Preferences.interfaceName, path: Preferences.coinevonetPath)
            coinevonet?.logAppender = appender
            coinevonet?.start()
        }

        sender.isEnabled = false;

        if let menu = statusBarItem.menu, let stop = menu.item(withTitle: "Stop") {
            stop.isEnabled = true
        }
    }

    @objc
    func stopCoinevonet(_ sender: NSMenuItem) {
        coinevonet?.stop()
        coinevonet = nil

        sender.isEnabled = false;

        if let menu = statusBarItem.menu, let start = menu.item(withTitle: "Run") {
            start.isEnabled = true
        }
    }

    @objc
    func terminate(_ sender: NSMenuItem) {
        NSApp.terminate(sender)
    }
}
