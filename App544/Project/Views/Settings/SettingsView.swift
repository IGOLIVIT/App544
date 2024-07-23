//
//  SettingsView.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()

                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                     
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 6) {

                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Rate Us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(spacing: 6) {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
