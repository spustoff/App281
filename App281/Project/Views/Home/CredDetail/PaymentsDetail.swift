//
//  PaymentsDetail.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI

struct PaymentsDetail: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("PAYMENT SCHEDULE")
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
                .padding(.bottom, 20)
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 10) {
                        
                        ForEach(viewModel.payments, id: \.self) { index in
                            
                            HStack {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .medium))

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
    }
}

#Preview {
    PaymentsDetail()
}
