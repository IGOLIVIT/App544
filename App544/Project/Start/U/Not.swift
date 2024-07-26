//
//  Not.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Не пропустите ничего")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 80)
                
                Spacer()
                
                VStack {
                    
                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Включить уыедомления")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                        })
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            }
            .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true

                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(6)
                            .background(Circle().fill(.black))
                    })
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
