//
//  ContentView.swift
//  Hello World
//
//  Practica de Swift
//
//  Created by Jesus Eduardo Soto Tirado on 10/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var mostrarTexto = false; // Se declara una variable booleana para asignar el estado inicial del texto.
    
    var body: some View {
        ZStack{
            
            if mostrarTexto{
                Text("Hello, World!")
                    .font(.system(size: 40, weight: .bold))
                    .opacity(mostrarTexto ? 1 : 0)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
            }
            VStack{
                Spacer()
                Button(){
                    withAnimation{
                        mostrarTexto.toggle() // se llama a la funcion toggle
                    }
                } label: {
                    Text(mostrarTexto ? "Ocultar Texto" : "Mostrar Texto")
                        .frame(minWidth: 180)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.bottom, 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(minWidth: 900, minHeight: 600)
    }
}
