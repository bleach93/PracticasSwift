//
//  ContentView.swift
//  Contador
//
//  Created by Jesus Eduardo Soto Tirado on 10/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var contador = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("\(contador)")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(colorForCounter())
            
            HStack(spacing: 20) {
                
                Button("-") {
                    if contador > 0 {
                        contador -= 1
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(contador == 0)
                
                Button("+") {
                    if contador < 10 {
                        contador += 1
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(contador == 10)
                
                Button("Reset") {
                    contador = 0
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // Lógica del color (fuera del body)
    func colorForCounter() -> Color {
        if contador >= 10 {
            return .red
        } else if contador >= 5 {
            return .orange
        } else {
            return .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
