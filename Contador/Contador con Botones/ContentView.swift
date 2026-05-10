//
//  ContentView.swift
//  Contador con Botones
//
//  Created by Jesus Eduardo Soto Tirado on 10/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var contador = 0 // variable contador asignada a 00
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(contador)").font(.system(size: 60, weight: .bold))
            HStack(spacing: 20){
                Button("-"){
                    if contador > 0{
                        contador -= 1
                    }
                }
                .buttonStyle(.borderedProminent)
                Button("+"){
                    contador += 1
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .frame(minWidth: 600, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
