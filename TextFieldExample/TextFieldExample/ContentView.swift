//
//  ContentView.swift
//  TextFieldExample
//
//  Created by 1v1 on 2021/01/09.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack{
            TextField("Placeholder", text: self.$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 16)
            Text(self.text)
            MapView()
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
