//
//  FamilyViewModel.swift
//  App281
//
//  Created by IGOR on 12/12/2023.
//

import SwiftUI

final class FamilyViewModel: ObservableObject {

    @AppStorage("familyNames") var familyNames: [String] = []
    @Published var isAdd: Bool = false
    @Published var name = ""
}
