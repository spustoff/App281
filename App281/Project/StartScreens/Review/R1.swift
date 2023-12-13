//
//  R1.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct R1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            Image("reviewers_1")
                .resizable()
            
            VStack {
                
                Text("ALL LOANS IN ONE PLACE")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 23, weight: .semibold))
                    .padding()
                    .padding(.top, 80)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    R1()
}
