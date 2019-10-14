//
//  AgregarCargaController.swift
//  ProyectoSegundoParcial
//
//  Created by Fer Barraza on 10/11/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import Foundation
import UIKit

class AgregarCargaController : UIViewController{
    var callbackAgregarCarga : ((Gasolina) -> Void)?
    var callbackActualizarCarga : (() -> Void)?
    var placas : String = ""
    @IBOutlet weak var txtCantidad: UITextField!
    @IBOutlet weak var txtLitros: UITextField!
    override func viewDidLoad() {
        self.title = "Agregar carga a:" + placas
    }
    @IBAction func doTapGuardar(_ sender: Any) {
        let carga = Gasolina(cantidad: Int(txtCantidad!.text ?? "0")!, litros: Int(txtLitros!.text ?? "0")!, placas: placas)
        callbackAgregarCarga!(carga)
        callbackActualizarCarga!()
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}
