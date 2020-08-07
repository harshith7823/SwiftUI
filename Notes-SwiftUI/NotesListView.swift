//
//  ContentView.swift
//  Notes-SwiftUI
//
//  Created by harshith on 04/08/20.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import SwiftUI

struct NotesListView: View {
    
    @EnvironmentObject var notes: Notes
    @State var showingDetail = false

    var body: some View {
        NavigationView {
            List{
                ForEach(notes.entries, id : \.id){ note in
                    NavigationLink(destination: Text("\(note.text)")) {
                        Text("\(note.text)")
                    }
                }
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingDetail.toggle()
                    
                }) {
                    Image(systemName: "plus").imageScale(.large)
                }.sheet(isPresented: $showingDetail) {
                    NewNoteView(showingDetail: self.$showingDetail).environmentObject(self.notes)
                }
            )
        }
    }
}

