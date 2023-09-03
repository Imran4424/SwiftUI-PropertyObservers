//
//  HomeView.swift
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

struct HomeView: View {
    // @ObservedObject works with classes
    // @ObservedObject updates the property changes when it receives announcement
    // @ObservedObject is the first choice when working with class
    // receiver
    @ObservedObject private var user = User()

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
        HomeView()
    }
}
