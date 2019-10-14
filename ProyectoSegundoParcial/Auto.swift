//
//  Auto.swift
//  ProyectoSegundoParcial
//
//  Created by Fer Barraza on 10/5/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import Foundation

class Auto{
    var placas : String?
    var marca : String?
    var modelo : String?
    var año : Int?
    var nombre : String?
    var imagenCarro : String?
    
    init(placas : String,marca : String,modelo : String,año : Int,nombre : String,imagenCarro : String) {
        self.placas = placas
        self.marca = marca
        self.modelo = modelo
        self.año = año
        self.nombre = nombre
        self.imagenCarro = imagenCarro
    }

}
