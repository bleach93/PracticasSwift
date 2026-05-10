//
//  ContentView.swift
//  Formulario Basico
//
//  Created by Jesus Eduardo Soto Tirado on 10/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var nombre = ""
    @State private var edad = ""
    @State private var resultado = ""
    
    var body: some View {
        Form {
            Section(header: Text("Datos Personales")) {
                TextField("Nombre", text: $nombre).textFieldStyle(.roundedBorder)
                    .frame(width: 250)
                
                TextField("Edad", text: $edad)
                    .onChange(of: edad) { newValue in
                        edad = newValue.filter { $0.isNumber }
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
            }
            
            Section {
                Button("Enviar") {
                    resultado = "Hola \(nombre), tienes \(edad) años"
                }
            }
            
            Section(header: Text("Resultado")) {
                Text(resultado)
            }
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
