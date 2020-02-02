//
//  CoinevonetRunner.swift
//  coinevonet
//
//  Copyright © 2019 Coinevo. All rights reserved.
//

import Foundation
import Cocoa

class CoinevonetRunner {
    let dnsManager: DNSManager
    let coinevonetPath: URL
    var process = Process()

    var logAppender: Appendable? = nil

    init(interface: String, path: String) {
        self.coinevonetPath = URL(fileURLWithPath: path)
        self.dnsManager = DNSManager(interface: interface)
    }

    func start() {
        process.executableURL = self.coinevonetPath
        process.arguments = ["--colour=false"]
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = outputPipe

        do {
            try self.dnsManager.setNewSettings()
            try process.run()
        } catch {
            NSApp.presentError(error)
        }

        guard let reader = StreamReader(fh: outputPipe.fileHandleForReading) else {
            let err = NSError(domain: "coinevonet", code: 0, userInfo: ["msg": "Failed to read from filehandle"])
            NSApp.presentError(err)
            return
        }

        DispatchQueue.global(qos: .background).async {
            for line in reader {
                print(line)
                DispatchQueue.main.async {
                    self.logAppender?.append(string: line)
                }
            }
        }
    }

    func stop() {
        if process.isRunning {
            process.terminate()
            process.waitUntilExit()
        }
        dnsManager.restoreOldSettings()
    }
}
