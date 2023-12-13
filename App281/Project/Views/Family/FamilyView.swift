//
//  FamilyView.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct FamilyView: View {
    
    @StateObject var viewModel = FamilyViewModel()
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Family")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                
                if viewModel.familyNames.isEmpty {
                    
                    Text("Add the family name first")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.familyNames, id: \.self) { index in
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 60)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
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
                    .opacity(viewModel.isAdd == true ? 0.5 : 0)
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack(spacing: 10) {
                    
                    Text("NEW FAMILY MEMBER")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Type name")
                            .foregroundColor(viewModel.name.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.name.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.name)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white)))
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        
                        viewModel.familyNames.append(viewModel.name)
                        
                        viewModel.name = ""
                        
                        UIApplication.shared.endEditing()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    .disabled(viewModel.name.isEmpty ? true : false)
                    .opacity(viewModel.name.isEmpty ? 0.5 : 1)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg2").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    FamilyView()
}
