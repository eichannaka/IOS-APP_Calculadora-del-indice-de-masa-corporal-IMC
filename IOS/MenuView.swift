//
//  MenuView.swift
//  IOS
//
//  Created by Eichan Nakagawa on 29/06/2025.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink   (destination:IMCView()){
                    Text("IMC Calculator")
                }
            }
            }
    }
}

#Preview {
    MenuView()
}
