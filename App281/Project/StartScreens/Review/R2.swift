//
//  R2.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct R2: View {
    
    var body: some View {
        
        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            Image("reviewers_2")
                .resizable()
            
            VStack {
                
                Text("SHARE WITH YOUR FAMILY")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 23, weight: .semibold))
                    .padding()
                    .padding(.top, 80)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R3()
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
    R2()
}
