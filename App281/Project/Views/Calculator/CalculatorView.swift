//
//  CalculatorView.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Calculator")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        CalcSavesView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Loan amount:")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Press amount")
                            .foregroundColor(viewModel.calAmount.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.calAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.calAmount)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                    Text("Loan term:")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("1 Year")
                            .foregroundColor(viewModel.calTerm.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.calTerm.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.calTerm)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                    Text("Interest rate:")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Press rate %")
                            .foregroundColor(viewModel.calRate.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.calRate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.calRate)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                .padding(.bottom)
                
                Button(action: {
  
                    UIApplication.shared.endEditing()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isResult = true
                    }
                    
                }, label: {
                    
                    Text("Calculate")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .disabled(viewModel.calAmount.isEmpty || viewModel.calRate.isEmpty || viewModel.calTerm.isEmpty ? true : false)
                .opacity(viewModel.calAmount.isEmpty || viewModel.calRate.isEmpty || viewModel.calTerm.isEmpty ? 0.5 : 1)
                
                Spacer()
            }
            .padding()
        }
        .overlay (
            
            ZStack {
                
                Color("b")
                    .ignoresSafeArea()
                    .opacity(viewModel.isResult == true ? 0.5 : 0)
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isResult = false
                        }
                    }
                
                VStack(spacing: 10) {
                    
                    Text("RESULT")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))

                    HStack {
                        
                        VStack(spacing: 15) {

                            Text("$\(viewModel.calculate2(amount: viewModel.amount, term: viewModel.term, rate: viewModel.rate))")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Monthly payment")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                        
                        VStack(spacing: 15) {
                            
                            Text("$\(viewModel.calculate(amount: viewModel.amount, term: viewModel.term, rate: viewModel.rate))")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .semibold))

                            Text("Percentages")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    }
                    .padding(.vertical)

                    Button(action: {
                        
                        
                        viewModel.addToHistory {
                                                    
                            viewModel.calAmount = ""
                            viewModel.calTerm = ""
                            viewModel.calRate = ""
                        }
                        
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isResult = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isResult = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg2").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isResult ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CalculatorView()
}
