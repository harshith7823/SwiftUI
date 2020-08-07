//
//  Note.swift
//  Notes-SwiftUI
//
//  Created by harshith on 04/08/20.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import Foundation

class Note :NSObject, NSSecureCoding  {
    
    var text : String
    var id = UUID()
    
    init(text : String){
        self.text = text
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.text, forKey: "title")
    }
    
    required init?(coder: NSCoder) {
        self.text = coder.decodeObject(forKey: "title") as! String
    }
}
