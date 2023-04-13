//
//  ContentView.swift
//  PropertyObservers
//
//  Created by Shah Md Imran Hossain on 13/4/23.
//

import SwiftUI

// we use struct for data independent views
struct User {
    // here
    // @State Observing these properties
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    // by default struct property in not editable
    // @State is making the property editable
    // @State variable also updates the views which are using them
    // @State is designed for simple properties which stays in one view
    // always make sure to use private for consistency
    // @State works only with Struct
    // @State everytime creates a new struct when property changes
    // @State does not work with classes, in case of class
    // when property changes, @State can not detect it
    @State private var user = User()

    var body: some View {
        VStack {
            // here is no $ sign
            // we don't want two way binding here
            // 1 - just read the value
            // text will not change here
            Text("Your name is \(user.firstName) \(user.lastName)")

            // $ - working as a bidirectional biniding operator
            // 1 - read the value from name
            // 2 - also update name while user the name TextField
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
