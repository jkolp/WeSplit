//
//  ContentView.swift
//  WeSplit
//
//  Created by Jasper on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    @State var amount : Double = 0.00
    @State var numOfPeople : Int = 2
    @State var tipPercentage : Int = 10
    @FocusState private var amountIsFocused: Bool
    
    let tipOptions : [Int] = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCOunt = Double(numOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCOunt
        
        return amountPerPerson
    }
    
    
    // body is a computed property syntax
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .onChange(of: amount) {
                            // Will need to add filter to keep the input as double decimal point
                        }
                    
                    Picker("Number of People", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section("SELECT TIP AMOUNT") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipOptions, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                
                Section("PER PERSON") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }.navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused.toggle()
                        }
                    }
                }
        }
    } // end of body
}

#Preview {
    ContentView()
}
