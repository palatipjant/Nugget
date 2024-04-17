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
                .opacity(0.85)
            
            VStack {
                Text("„")
                    .font(.custom("RobotoMono-Medium", size: 40))
                Text(viewmodel.advice.advice)
                    .font(.custom("RobotoMono-Medium", size: 40))
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .leading)
                Text("„")
                    .font(.custom("RobotoMono-Medium", size: 40))
            }
            .padding(.horizontal, 30)
            .foregroundStyle(.font01)
        }
        .task {
            viewmodel.getAdvice()
        }
    }
}

#Preview {
    AdviceView()
}
