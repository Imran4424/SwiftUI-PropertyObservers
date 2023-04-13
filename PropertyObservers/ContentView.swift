//
//  ContentView.swift
//  PropertyObservers
//
//  Created by Shah Md Imran Hossain on 13/4/23.
//

import SwiftUI

// we use class for sharing the data into multiple views
class User: ObservableObject {
    // here
    // @StateObject Observing these properties
    // @Published marked the properties which we need to watch
    // we can observe some and ignore some with @Published
    // sender
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    // @StateObject works with classes
    // @StateObject everytime creates a new class instances when property changes
    // @StateObject is not the first choice when
    // we need to share data into multiple views (because everytime creates a new class instances)
    // receiver
    @StateObject private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")

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
