//
//  SettingsView.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Setting")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Rate app")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .medium))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1fOxTnxbgnc5Sc3VR0pDyK8fpNWTjhIHFp1FV3Jk-PTQ/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 15, weight: .medium))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
