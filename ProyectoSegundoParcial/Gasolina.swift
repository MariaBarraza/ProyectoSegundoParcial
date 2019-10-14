//
//  Gasolina.swift
//  ProyectoSegundoParcial
//
//  Created by Fer Barraza on 10/11/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import Foundation
class Gasolina {
    var cantidad : Int?
    var litros : Int?
    var placas : String
    
    init(cantidad : Int, litros : Int,placas : String) {
        self.cantidad = cantidad
        self.litros = litros
        self.placas = placas
    }
}
