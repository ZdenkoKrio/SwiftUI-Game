//
//  InfoView.swift
//  Slot Machine
//
//  Created by Zdenko Čepan on 06.11.2023.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the aplitcation")) {
                    FormRowView(firstItem: "Aplication", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Zdenko Čepan")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Copyright", secondItem: "2020 all rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                } // SECTION
            } // FORM
            .font(.system(.body, design: .rounded))
        } // VSTACK
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(.secondary)
            , alignment: .topTrailing
        )
        .onAppear(
            perform: {
                playSound(sound: "background-music", type: "mp3")
            })
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundStyle(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}


#Preview {
    InfoView()
}
