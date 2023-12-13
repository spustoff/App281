//
//  LoadingView.swift
//  App281
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            Image("LLOgo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
            .padding()
        }
    }
}

#Preview {
    LoadingView()
}
