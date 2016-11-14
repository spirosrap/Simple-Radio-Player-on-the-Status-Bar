//
//  AppDelegate.swift
//  statusbar
//
//  Created by spiros on 14/11/2016.
//  Copyright © 2016 spiros. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    var task = Process()
    
    let url = "http://37.59.32.115:6224/stream"
    let vlcPath = "/usr/local/bin/vlc"
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Start Radio", action: #selector(startRadio), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Stop Radio", action: #selector(stopRadio), keyEquivalent: "q"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "Q"))
        statusItem.menu = menu
        
        task.launchPath = vlcPath
        task.arguments = [url]
        

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        if task.isRunning {
            task.terminate()
        }
    }
    
    func startRadio(){
        DispatchQueue.global(qos: .background).async {
                print("Started")
                if let button = self.statusItem.button {
                    button.image = NSImage(named: "radioButtonImage")
                }

                self.task.launch()
                self.task.waitUntilExit()
        }
    }
    
    func stopRadio(){
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
        }
        task.terminate()
        task = Process()
        task.launchPath = vlcPath
        task.arguments = [url]
    }
    
    func quit(){
        if task.isRunning {
            task.terminate()
        }
        exit(0)
    }
    

}

