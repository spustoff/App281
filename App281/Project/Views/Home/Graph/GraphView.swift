//
//  GraphView.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI

struct GraphView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedCurrency)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                    
                    HStack {
                                                
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        
                        Spacer()

                    }
                }
                .padding()
                .padding(.top)
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Currency value")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("$\(String(format: "%.f", Double(.random(in: 80...110)))).\(String(format: "%.f", Double(.random(in: 10...99))))")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                    
                    Text("+ $\(String(format: "%.f", Double(.random(in: 10...60)))).\(String(format: "%.f", Double(.random(in: 10...90))))")
                        .foregroundColor(Color("green"))
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("(0.\(String(format: "%.f", Double(.random(in: 10...90))))%)")
                        .foregroundColor(Color("green"))
                        .font(.system(size: 14, weight: .bold))
                    
                    Spacer()
                }
                .padding()
                
                Image("graph")
                    .resizable()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                }
                .padding()
            }
        }
    }
}

#Preview {
    GraphView()
}
