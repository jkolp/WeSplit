//
//  NameCard.swift
//  WeSplit
//
//  Created by Jasper on 2/22/24.
//

import SwiftUI

struct NameCard: View {
    @Binding var name : String
    
    var body: some View {
        name.isNotEmpty() ? Text("My name is \(name)") : Text("Wait for it...")
        
    }
}

struct NameCard_Previews: PreviewProvider {
    static var previews: some View {
        NameCard(name: .constant("Jasper"))
    }
}

extension String {
    
    func isNotEmpty() -> Bool {
        if self != "" {
            return true
        }
        
        return false
    }
}
