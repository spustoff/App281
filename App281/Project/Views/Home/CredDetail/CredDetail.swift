//
//  CredDetail.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI

struct CredDetail: View {
    
    @StateObject var viewModel: HomeViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedCredit?.credName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .regular))
                    
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
                                
                                Spacer()
                            }
                        })
                    }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Debt")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("$\(viewModel.debt2)")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 26, weight: .medium))
                    
                    Spacer()
                    
                    Text("You have no active credit")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 170)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding(.vertical)
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.isPaymentsDetail = true
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "calendar")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Payment schedule")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewDept = true
                        }
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "creditcard")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Deposit the amount")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                }
                
                Text("PEOPLE")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 10) {
                        
                        ForEach(viewModel.credits, id: \.self) { index in
                            
                            HStack {
                                
                                Text(index.selectedUser ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Spacer()
                                
                                VStack {
                                    
                                    Text(index.credAmount ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 14, weight: .medium))
                                    
                                    Text("Total amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight :.regular))
                                    
                                    Text("$\(String(format: "%.f", Double(.random(in: 10...40))))000")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight :.regular))
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCredits()
        }
        .overlay (
            
            ZStack {
                
                Color("b")
                    .ignoresSafeArea()
                    .opacity(viewModel.isNewDept == true ? 0.5 : 0)
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewDept = false
                        }
                    }
                
                VStack(spacing: 10) {
                    
                    Text("DEPOSIT THE AMOUNT")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text("Who pays:")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        ForEach(viewModel.whoPays, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedWhoPays = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 20)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(viewModel.selectedWhoPays == index ? .white.opacity(0.2) : .white.opacity(0)))
                            })
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 22)
                    .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.1)))
                    
                    Text("Amount")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Press Desired Amount")
                            .foregroundColor(viewModel.amountPayment.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.amountPayment.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.amountPayment)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                    Text("Date")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(content: {
                        
                        DatePicker("Departure", selection: $viewModel.amountPaymentDate, in: Date()..., displayedComponents: .date)
                            .labelsHidden()
                        
                        Spacer()
                        
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))

                    Button(action: {
                        
                        UIApplication.shared.endEditing()
                        
                        viewModel.payments.append("\(viewModel.selectedWhoPays)   $\(viewModel.amountPayment)   \(viewModel.amountPaymentDate)")
                        
                        viewModel.debt2 += Int(viewModel.amountPayment) ?? 0
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewDept = false
                            
                        }
                            
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    .disabled(viewModel.amountPayment.isEmpty ? true : false)
                    .opacity(viewModel.amountPayment.isEmpty ? 0.5 : 1)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg2").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isNewDept ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isPaymentsDetail, content: {
            
            PaymentsDetail()
        })
    }
}

#Preview {
    CredDetail(viewModel: HomeViewModel())
}
