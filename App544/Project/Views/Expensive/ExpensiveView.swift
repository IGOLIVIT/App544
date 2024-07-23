//
//  ExpensiveView.swift
//  App544
//
//  Created by IGOR on 17/07/2024.
//

import SwiftUI

struct ExpensiveView: View {
    
    @StateObject var viewModel = ProjectViewModel()
    @StateObject var mainModel: ExpensiveViewModel
    
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
                            
                            VStack(alignment: .leading) {
                                
                                Text("History")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("It's empty here. Add a new entry")
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
                                            
                                            HStack {
                                                
                                                Text("History")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 24, weight: .bold))
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                    mainModel.currentProject = index.prName ?? ""
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        mainModel.isAddEx = true
                                                    }
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: "plus")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 16, weight: .medium))
                                                })
                                            }
                                            
                                            LazyVStack {
                                                
                                                ForEach(mainModel.expensives.filter{($0.exProj ?? "") == (index.prName ?? "")}, id: \.self) { indexer in
                                                    
                                                    VStack(spacing: 10) {
                                                        
                                                        HStack {
                                                            
                                                            Text(indexer.exName ?? "")
                                                                .foregroundColor(.black)
                                                                .font(.system(size: 16, weight: .medium))
                                                            
                                                            Spacer()
                                                            
                                                            Text("$\(indexer.exSum ?? "")")
                                                                .foregroundColor(.black)
                                                                .font(.system(size: 16, weight: .medium))
                                                        }
                                                        
                                                        Rectangle()
                                                            .fill(.gray)
                                                            .frame(maxWidth: .infinity)
                                                            .frame(height: 1)
                                                            .padding(.bottom, 10)
                                                    }
                                                }
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                            
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                                        
                                        Spacer()
                                        
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
        .onAppear {
            
            mainModel.fetchExpensives()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(mainModel.isAddEx ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            mainModel.isAddEx = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                mainModel.isAddEx = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Record")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Name")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(mainModel.exName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $mainModel.exName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                    .padding(1)
                    
                    Text("Sum")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(mainModel.exSum.isEmpty ? 1 : 0)
                        
                        TextField("", text: $mainModel.exSum)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                    .padding(1)
                    
                    Text("Item")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .opacity(mainModel.isAddItem ? 1 : 0)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(mainModel.exItem.isEmpty ? 1 : 0)
                        
                        TextField("", text: $mainModel.exItem)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                    .padding(1)
                    .opacity(mainModel.isAddItem ? 1 : 0)
                    
                    Button(action: {
                        
                        mainModel.isAddItem = true
                        
                    }, label: {
                        
                        Text("+ Add an item")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(mainModel.isAddItem ? 0 : 1)
                    
                    HStack {
                        
                        Button(action: {
                            
                            mainModel.isAddEx = false
                            
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
                            
                            mainModel.exProj = mainModel.currentProject
                            
                            mainModel.addExpensive()
                            
                            mainModel.exName = ""
                            mainModel.exSum = ""
                            mainModel.exItem = ""
                            mainModel.isAddItem = false
                            
                            mainModel.fetchExpensives()
                            
                            withAnimation(.spring()) {
                                
                                mainModel.isAddEx = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            
                        })
                        
                    }
                    .padding(.vertical)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: mainModel.isAddEx ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ExpensiveView(mainModel: ExpensiveViewModel())
}
