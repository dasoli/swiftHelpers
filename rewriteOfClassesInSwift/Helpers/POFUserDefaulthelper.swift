//
//  POFUserDefaulthelper.swift
//  rewriteOfClassesInSwift
//
//  Created by Oliver Franke on 19.02.16.
//  Copyright © 2016 Oliver Franke. All rights reserved.
//

import Foundation

class POFUserDefaulthelper: NSObject {

    /**
     Use this Function to store non NSEncode confirmed classes to the UserDef
     
     - parameter _object: Anything you want
     - parameter _key:    a key for accessing
     */
    static func saveCustomObjectToUserdefaults(_object: AnyObject, _key: String) {
        assert(_key.isEmpty)
        let encodedObject: NSData! = NSKeyedArchiver .archivedDataWithRootObject(_object)
        let defaults: NSUserDefaults = NSUserDefaults .standardUserDefaults()
        defaults .setObject(encodedObject, forKey: _key)
        defaults .synchronize()
    }

    static func dataFromArray(_theArray: NSArray) -> NSData {
        return NSKeyedArchiver .archivedDataWithRootObject(_theArray)
    }
    
    /**
     You will receive an non nil array from Data Objects
     
     - parameter _data: fill in NSDATA
     
     - returns: a non nil Array
     */
    static func arrayFromArchivedData(_data: NSData) -> NSArray? {
        return (NSKeyedUnarchiver.unarchiveObjectWithData(_data) as! NSArray)
    }
}
