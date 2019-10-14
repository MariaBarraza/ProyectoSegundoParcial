//
//  AgregarAutoController.swift
//  ProyectoSegundoParcial
//
//  Created by Fer Barraza on 10/9/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import Foundation
import UIKit

class AgregarAutoController : UIViewController{
    var callbackAgregar : ((Auto)->Void)?
    
    @IBOutlet weak var txtPlaca: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtModelo: UITextField!
    @IBOutlet weak var txtAño: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    override func viewDidLoad() {
        self.title = "Agregar Nuevo Auto"
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        let auto = Auto(placas: txtPlaca.text!, marca: txtMarca.text!, modelo: txtModelo.text!, año: Int(txtAño.text!) ?? 0, nombre: txtNombre.text!, imagenCarro: "carroGenerico")
        callbackAgregar!(auto)
        self.navigationController?.popViewController(animated: true)
    }
}

