//
//  ContentView.swift
//  WeSplit
//
//  Created by Ferdian Gunawan on 10/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    @State private var name2 = ""
    let students = ["Gugun", "Ferdian", "Gunawan"]
    let tipPercentages = [20,40,60,80]
    @State private var selectedStudent = " Ferdian"
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
//    for keyboard
    @FocusState private var amountIsFocused: Bool
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationView {
                    Form{
                        Group{
                            Text("Bebek")
                            Text("Ayam")
                            Text("Bebek")
                        }
                        Section{
                            Text("Ayam")
                            Text("Bebek")
                            TextField("Enter name: ", text: $name)
                        }
                        Section {
                            Picker("Tip percentage", selection: $tipPercentage) {
                                ForEach(tipPercentages, id: \.self) {
                                    Text($0, format: .percent)
                                }
                            }
                            .pickerStyle(.segmented)
                        } header: {
                            Text("How much tip do you want to leave?")
                        }
                        Section {
                            Text("\(tipPercentage)")
                        }
                       
                        Button("Tap Me: \(tapCount)"){
                            self.tapCount += 1
                        }
                        Picker("Select your student", selection: $selectedStudent){
                            ForEach(students, id: \.self){
                                Text($0)
                            }
                        }
                        // locale.current deteksi lokasi kita kalau ada jika tidak dia ID
                        Section {
                            Text("Masukkan nilai")
                            TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad).focused($amountIsFocused)
                        }
                        Section {
                               Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                           }
                        ForEach(0..<3) {
                            data in Text("Form \(data)")
                        }
                        // because foreach passes in a closure, we can use shorthand syntax
                        ForEach(0..<5) {
                            Text("short syntax: \($0)")
                        }
            }
                    .foregroundColor(.blue)
                    .navigationTitle("Bebek Bumbu Desa").toolbar {
                        ToolbarItemGroup (placement: .keyboard){
                            Spacer()
                            Button("Done"){
                                amountIsFocused = false
                            }
                        }
                    }
                .navigationBarTitleDisplayMode(.automatic)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
