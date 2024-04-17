//
//  AdviceView.swift
//  Nugget
//
//  Created by Palatip Jantawong on 17/4/2567 BE.
//

import SwiftUI

struct AdviceView: View {
    
    @ObservedObject var viewmodel = AdviceViewModel()
    
    var body: some View {
        ZStack{
            
            Image("bg")
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack{
                Text("Trust yourself!")
                    .font(.custom("RobotoMono-Medium", size: 15))
                    .frame(maxWidth: 326)
                    .foregroundStyle(.gray)
                    .padding(.vertical, 10)
                Spacer()
            }.padding(50)
            
            if !viewmodel.isLoading {
                VStack {
                    Text("🫶🏻")
                        .font(.custom("RobotoMono-Medium", size: 45))
                    Text(viewmodel.advice.advice)
                        .font(.custom("RobotoMono-Medium", size: 30))
                        .frame(maxWidth: 326)
                        .foregroundStyle(.black)
                        .padding(.vertical, 10)
                    Text("🫶🏻")
                        .font(.custom("RobotoMono-Medium", size: 45))
                }
                .padding(.horizontal, 40)
                .foregroundStyle(.font01)
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
            VStack{
                Spacer()
                HStack {
                    Button(action: {
                        viewmodel.getAdvice()
                    }, label: {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.whity)
                            .overlay {
                                Image(systemName: "arrow.clockwise")
                                    .imageScale(.large)
                                    .foregroundStyle(.black)
                            }
                            .shadow(color: .gray, radius: 0.5)
                    })
                    Spacer()
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.whity)
                        .overlay {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                        }
                        .shadow(color: .gray, radius: 0.5)
                    Spacer()
                    ShareLink(item: viewmodel.advice.advice) {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.whity)
                            .overlay {
                                Image(systemName: "square.and.arrow.up")
                                    .imageScale(.large)
                                    .foregroundStyle(.black)
                            }
                            .shadow(color: .gray, radius: 0.5)
                    }
                }
                
            }.padding(50)
        }
        .task {
            viewmodel.getAdvice()
        }
        
    }
}

#Preview {
    AdviceView()
}
