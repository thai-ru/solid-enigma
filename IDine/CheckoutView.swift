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
    
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    let paymentTypes = ["Cash", "Credit Card", "Loyalty Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    
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
            
            Section {
                Toggle("Add iDine loyalty card", isOn: $addloyaltyDetails.animation())
                
                if addloyaltyDetails {
                    TextField("Enter iDne ID", text: $loyaltyNumber)
                }
            }
            
            Section("Feeling Generous! Tip Here") {
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
               
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    
                }
            }
            
        }
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            Button("Confirm Order") {
                showingPaymentAlert.toggle()
            }
        } message: {
            Text("You will pay \(totalPrice) - thank you :)")
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
