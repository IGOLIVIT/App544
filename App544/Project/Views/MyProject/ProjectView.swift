//
//  ProjectView.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI

struct ProjectView: View {
    
    @StateObject var viewModel = ProjectViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Your projects")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .medium))
                    })
                }
                
                if viewModel.projects.isEmpty {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            ZStack {
                                
                                Circle().stroke(.black, lineWidth: 5)
                                    .frame(width: 40)
                                    .padding(5)
                                
                                Text("0%")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                            VStack(alignment: .leading) {
                                
                                Text("$0.00")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("$0.0")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        
                        VStack {
                            
                            Text("Your project")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image(systemName: "photo")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 50))
                                .frame(maxWidth: .infinity)
                                .frame(height: 150)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ Create a project")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color("prim")))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Description")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("The project description is not available")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .padding(.vertical, 7)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                    }
                }
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.projects, id: \.self) { index in
                                    
                                    VStack {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle().stroke(.black, lineWidth: 5)
                                                .frame(width: 40)
                                                .padding(5)
                                            
                                            Text("\(((Int(index.prBudget ?? "") ?? 0)/viewModel.totBud) * 100)%")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text("$\(viewModel.totBud)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Text("$\(index.prBudget ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                                    
                                    VStack {
                                        
                                        Text(index.prName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .bold))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Image(index.prPhoto ?? "")
                                            .resizable()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 150)
                                            .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("Description")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .bold))
                                        
                                        Text(index.prDescr ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(.vertical, 7)
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                                    
                                }
                                    .frame(width: 330)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchProjects()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddProject(viewModel: viewModel)
        })
    }
}

#Preview {
    ProjectView()
}
