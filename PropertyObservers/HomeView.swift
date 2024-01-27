//
//  HomeView.swift
//  PropertyObservers
//
//  Created by Shah Md Imran Hossain on 13/4/23.
//

import SwiftUI

// we use class for sharing the data into multiple views
@MainActor
class User: ObservableObject {
    // here
    // @StateObject Observing these properties
    // @Published marked the properties which we need to watch
    // we can observe some and ignore some with @Published
    // sender
    @Published var name = "Imran Hossain"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct HomeView: View {
    // @ObservedObject works with classes
    // @ObservedObject updates the property changes when it receives announcement
    // @ObservedObject is the first choice when working with class
    // receiver
    @ObservedObject var user = User()

    var body: some View {
        VStack {
            EditView().environmentObject(user)
            DisplayView().environmentObject(user)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
