//
//  EditarContactoController.swift
//  ProyectoSegundoParcial
//
//  Created by Fer Barraza on 10/5/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import Foundation
import UIKit

class EditarAutoController : UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tvCarga: UITableView!
    
    var auto : Auto?
    var cargas : [Gasolina] = []
    
    
    var state = false
    var callbackActualizarTabla : (()->Void)?
    var callbackAgregarCarga1: ((Gasolina)->Void)?
    var callbackEliminarCarga: ((Int)->Void)?
    
    @IBOutlet weak var txtPlaca: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtModelo: UITextField!
    @IBOutlet weak var txtAño: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    
    
    @IBOutlet weak var btnAccion: UIBarButtonItem!
 
    override func viewDidLoad() {
        //txtPlaca.text = "\(cargas.count)"
        txtPlaca.text = auto!.placas
        txtMarca.text = auto!.marca
        txtModelo.text = auto!.modelo
        txtAño.text = "\(auto!.año ?? 0)"
        txtNombre.text = auto!.nombre
        self.title = auto!.placas
    }
    
    @IBAction func doTapEditar(_ sender: Any) {
        if (state == false)
        {
            btnAccion.title = "Guardar"
            txtPlaca.isEnabled = true
            txtMarca.isEnabled = true
            txtModelo.isEnabled = true
            txtAño.isEnabled = true
            txtNombre.isEnabled = true
            state = true
        }else if(state == true)
            {
                auto!.placas = txtPlaca.text
                auto!.marca = txtMarca.text
                auto!.modelo = txtModelo.text
                auto!.año = Int(txtAño.text ?? "0")
                auto!.nombre = txtNombre.text
                callbackActualizarTabla!()
                self.navigationController?.popViewController(animated: true)
            }
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cargas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCargas") as? CeldaCargaController
            celda?.lblprecio.text = "$" + "\(cargas[indexPath.row].cantidad!)"
        celda?.lblLitro.text = "lt: " + "\(cargas[indexPath.row].litros!)"
        celda?.lblPlaca.text = cargas[indexPath.row].placas
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToCargas")
        {
            let destino = segue.destination as? AgregarCargaController
            destino?.placas = auto!.placas!
            destino?.callbackAgregarCarga = callbackAgregarCarga1
            destino?.callbackActualizarCarga = actualizarTablaCarga
        }
    }
    func actualizarTablaCarga(){
        tvCarga.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let posicion = indexPath.row
            callbackEliminarCarga!(posicion)
            self.navigationController?.popViewController(animated: true)
            tvCarga.reloadData()
        }
       
    }
}

