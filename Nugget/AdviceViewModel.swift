//
//  AdviceViewModel.swift
//  Nugget
//
//  Created by Palatip Jantawong on 17/4/2567 BE.
//

import Foundation
import SwiftUI

@MainActor
final class AdviceViewModel: ObservableObject, Observable {
    
    @Published var advice: Slip = Slip(id: 0, advice: "")
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getAdvice() {
        isLoading = true
        Task{
            do{
                advice = try await NetworkManager.shared.fetchAdvice()
                isLoading = false
            } catch{
                alertItem = AlertContext.GeneralError
            }
        }
    }
}
