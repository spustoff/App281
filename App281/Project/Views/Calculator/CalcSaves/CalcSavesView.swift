//
//  CalcSavesView.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI
import CoreData

struct CalcSavesView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()
                    
                }
                .padding(.bottom)
                
                if viewModel.history.isEmpty {
                    
                    VStack(spacing: 10) {
                        
                        Text("EMPTY")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Add favorite")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.history, id: \.self) { index in
                            
                            HStack {
                                
                                VStack(spacing: 6) {
                                    
                                    HStack {
                                        
                                        Text("Result from")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Text((index.calDate ?? Date()).convertDate(format: "MMM d"))
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    Text("Loan amount")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text("$\(index.calAmount ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 6) {
                                    
                                    Text("Loan term")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text("\(index.calTerm ?? "") Years")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 6) {
                                    
                                    Text("Interest rate")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text("\(index.calRate ?? "")%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHistory()
        }
    }
}

#Preview {
    CalcSavesView()
}
