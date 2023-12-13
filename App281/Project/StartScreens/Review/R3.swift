//
//  R3.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            Image("reviewers_3")
                .resizable()
            
            VStack {
                
                Text("CALCULATE THE LOAN RIGHT NOW")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 23, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 80)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    R3()
}
