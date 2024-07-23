//
//  AddProject.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI

struct AddProject: View {
    
    @StateObject var viewModel: ProjectViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.pphotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curPphoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curPphoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 50, weight: .regular))
                                    .frame(height: 200)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.curPphoto)
                                    .resizable()
                                    .frame(height: 200)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(30)
                            }
                            
                        })
                        .padding(.vertical)
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 1) {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.prName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.prName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                            .padding(1)
                            
                        }
                        .padding(.bottom)
                        
                        
                        Text("Budget")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 1) {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("2 456")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.prBudget.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.prBudget)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                            .padding(1)
                        }
                        
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 1) {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Your notes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.prDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.prDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                            .padding(1)
                        }
                    }
                    .padding(.bottom, 25)
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.prName = ""
                            viewModel.prBudget = ""
                            viewModel.prDescr = ""
                            viewModel.curPphoto = ""
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Cancel")
                                    .foregroundColor(Color("lbg"))
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("lbg")))
                            }
                        })
                        
                        Button(action: {
                            
                            viewModel.totBud += Int(viewModel.prBudget) ?? 0
                            viewModel.prPhoto = viewModel.curPphoto
                            
                            viewModel.addProject()
                            
                            viewModel.prName = ""
                            viewModel.prBudget = ""
                            viewModel.prDescr = ""
                            viewModel.curPphoto = ""
                            
                            viewModel.fetchProjects()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            
                        })
                        .opacity(viewModel.prName.isEmpty || viewModel.prBudget.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.prName.isEmpty || viewModel.prBudget.isEmpty ? true : false)
                    }
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddProject(viewModel: ProjectViewModel())
}
