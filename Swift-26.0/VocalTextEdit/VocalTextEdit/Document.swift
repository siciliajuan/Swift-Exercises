//
//  Document.swift
//  VocalTextEdit
//
//  Created by juan sicilia on 17/6/17.
//  Copyright © 2017 juan sicilia. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents: String = ""

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        let viewController = windowController.contentViewController as! ViewController
        viewController.content = contents
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.content ?? ""
        if let data = contents.data(using: String.Encoding.utf8) {
            return data
        } else {
            let userInfo = [NSLocalizedFailureReasonErrorKey: "File cannot be encoded in UTF-8"]
            throw NSError(domain: "es.juansicilia.vocalTextEdit", code: 0, userInfo: userInfo)
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
            self.contents = contents
        } else {
            let userInfo = [NSLocalizedFailureReasonErrorKey: "File is notvalid UTF-8"]
            throw NSError(domain: "es.juansicilia.vocalTextEdit", code: 0, userInfo: userInfo)
        }
    }


}

