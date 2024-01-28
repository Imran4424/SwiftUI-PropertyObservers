//
//  ContentView.swift
//  PropertyObservers
//
//  Created by Shah Md Imran Hossain on 13/4/23.
//

import SwiftUI

@MainActor
class DelayedUpdater: ObservableObject {
    // manually doing publisher's work
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

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
    
    @StateObject private var updater = DelayedUpdater()
    @State private var isDelayedShowing = false

    var body: some View {
        VStack {
            Toggle(isOn: $isDelayedShowing) {
                Text("Show Delay")
            }
            .padding()
            
            Spacer()
            
            if isDelayedShowing {
                Text("value is \(updater.value)")
            } else {
                Text("Your name is \(user.firstName) \(user.lastName)")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
