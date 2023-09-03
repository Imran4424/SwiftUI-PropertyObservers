//
//  BindingProperty.swift
//  PropertyObservers
//
//  Created by Shah Md Imran Hossain on 3/9/23.
//

import SwiftUI

struct PushButton: View {
    let title: String
    // state will not work here
    // state only modify value locally
    // does not send back the value
//    @State var isOn: Bool
    // Binding not only modify the value locally
    // also send it back to the calling place
    // Binding is called exteral state
    @Binding var isOn: Bool
    
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors: offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingProperty: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct BindingProperty_Previews: PreviewProvider {
    static var previews: some View {
        BindingProperty()
    }
}
