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
    
    @State private var addloyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let paymentTypes = ["Cash", "Credit Card", "Loyalty Points"]
    
    
    var body: some View {
        Form {
            Section {
                Picker(
                    "Select payment option!",
                    selection: $paymentType){
                        ForEach(paymentTypes, id:\.self) {
                            Text($0)
                        }
                    }
            }
            
            Toggle("Add iDine loyalty card", isOn: $addloyaltyDetails.animation())
            
            if addloyaltyDetails {
                TextField("Enter iDne ID", text: $loyaltyNumber)
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
