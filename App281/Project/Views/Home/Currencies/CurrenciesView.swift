//
//  CurrenciesView.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("CURRENCY PAIR")
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
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12, content: {
                                                
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedCurrency = index
                                
                                viewModel.isGraph = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.selectedCurrency == index ? Color("prim") : .white)
                                        .font(.system(size: 13, weight: .regular))
                                }
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                        }
                    })
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGraph, content: {
            
            GraphView()
        })
    }
}

#Preview {
    CurrenciesView()
}
