//
//  NewNoteView.swift
//  Notes-SwiftUI
//
//  Created by harshith on 07/08/20.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import SwiftUI

struct NewNoteView : View {

    @EnvironmentObject var notes: Notes
    @State private var username: String = ""
    @Binding var showingDetail: Bool
    
    var body: some View {
        VStack{
            TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)")
             }){
                 print("Username onCommit")
            }
           .padding()
            
            Button(action: {
                do {
                    let note = Note(text: self.username)
                    self.notes.entries.append(note)
                    let encoded = try NSKeyedArchiver.archivedData(withRootObject: self.notes.entries as Array, requiringSecureCoding: false)
                    UserDefaults.standard.set(encoded, forKey: "Key")
                } catch let myError {
                       print("caught: \(myError)")
                }
                self.showingDetail = false
                }){
                    Text("Done")
            }
        }
    }
}

