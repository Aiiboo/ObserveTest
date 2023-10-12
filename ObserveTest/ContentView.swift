//
//  ContentView.swift
//  ObserveTest
//
//  Created by Ibrahim Ramadan on 24.09.23.
//

import SwiftUI
import Observation

class Speicherwert: ObservableObject {
    @Published var zahler: Int
    init(zahler: Int) {
        self.zahler = zahler
    }
}
 
struct ContentView: View {
    
    @StateObject var speicher = Speicherwert(zahler: 0)
    
    var body: some View {
        VStack (spacing: 60){
            TextAnzeige(wert: speicher.zahler)
            ButtonView(wert: $speicher.zahler)
        }
    }
}

struct TextAnzeige: View{
     var wert: Int
    var body: some View{
        Text("Wert ist jetzt auf: \(wert)")
    }
}

struct ButtonView: View{
    @Binding var wert: Int
    var body: some View{
        Button(action: {
            wert+=1
        }, label: {
            Text("Change Value")
        }).buttonStyle(.borderedProminent)
    }
}


#Preview {
    ContentView()
}
