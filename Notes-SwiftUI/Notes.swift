//
//  Notes.swift
//  Notes-SwiftUI
//
//  Created by harshith on 07/08/20.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import Foundation

class Notes: ObservableObject {
    @Published var entries : [Note]
    
    init(notes : [Note]){
        self.entries = notes
    }
}
