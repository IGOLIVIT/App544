//
//  LoadingView.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("LLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoadingView()
}
