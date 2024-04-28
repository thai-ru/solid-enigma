//
//  CheckoutView.swift
//  IDine
//
//  Created by Robinson Thairu on 29/04/2024.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    
    let paymentTypes = ["Cash", "Credit Card", "Loyalty Points"]
    
    
    var body: some View {
        VStack {
            Section {
                Picker(
                    "Select payment option!",
                    selection: $paymentType){
                        ForEach(paymentTypes, id:\.self) {
                            Text($0)
                        }
                    }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
