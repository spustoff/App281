//
//  HomeView.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        CurrenciesView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("\(viewModel.selectedCurrency)")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                    })
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Debt")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("$\(viewModel.debt)")
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
                    
                    Text("EXPENSES")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewCredit = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                    })
                }
                
                if viewModel.credits.isEmpty {
                    
                    Text("Add the credit you have")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 10) {
                        
                        ForEach(viewModel.credits, id: \.self) { index in
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text(index.credName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Text("The credit is divided")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(index.selectedUser ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text("$\(index.credAmount ?? "")")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Text("Total amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text("$\(String(format: "%.f", Double(.random(in: 10...40))))000")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .onTapGesture {
                                
                                viewModel.selectedCredit = index
                                
                                viewModel.isDetail = true
                                
                            }
                        }
                    }
                    
                }
            }
            }
            .padding()
        }
        .overlay (
            
            ZStack {
                
                Color("b")
                    .ignoresSafeArea()
                    .opacity(viewModel.isNewCredit == true ? 0.5 : 0)
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewCredit = false
                        }
                    }
                
                VStack(spacing: 10) {
                    
                    Text("NEW CREDIT")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Press Name")
                            .foregroundColor(viewModel.credName.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.credName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.credName)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                    Text("Amount")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Press Desired Amount")
                            .foregroundColor(viewModel.credAmount.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.credAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.credAmount)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                    Text("Term")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("1 Year")
                            .foregroundColor(viewModel.credTerm.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.credTerm.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.credTerm)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    
                    Text("People")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.familyNames.isEmpty {
                        
                        Text("You don't have any family's person. Add him on 'Family' Section")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                    } else {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.familyNames, id: \.self) {index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentPeople = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                            .frame(width: 150, height: 60)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currentPeople == index ? .black.opacity(0.3) : .black))
                                        
                                    })
                                }
                            }
                        }
                        .frame(height: 80)
                    }
                    
                    Button(action: {
                        
                        UIApplication.shared.endEditing()
                        
                        viewModel.addCredit(selectedUser: viewModel.currentPeople, completion: {
                            
                            viewModel.currentPeople = ""
                            viewModel.credAmount = ""
                            viewModel.credTerm = ""
                            viewModel.credName = ""
                            viewModel.debt += Int(viewModel.credAmount) ?? 0
                            
                            viewModel.fetchCredits()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNewCredit = false
                            
                        }
                            
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    .disabled(viewModel.credName.isEmpty || viewModel.credTerm.isEmpty || viewModel.credAmount.isEmpty || viewModel.currentPeople.isEmpty ? true : false)
                    .opacity(viewModel.credName.isEmpty || viewModel.credTerm.isEmpty || viewModel.credAmount.isEmpty || viewModel.currentPeople.isEmpty ? 0.5 : 1)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg2").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isNewCredit ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchCredits()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CredDetail(viewModel: HomeViewModel())
        })
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}


extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
