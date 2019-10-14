//
//  ViewController.swift
//  ProyectoSegundoParcial
//
//  Created Fer Barraza on 10/5/19.
//  Copyright © 2019 Fer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tvAutos: UITableView!
    
    var autos : [Auto] = []
    var cargas : [Gasolina] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autos.append(Auto(placas: "JHYA892", marca: "BMW", modelo: "Bugatti", año: 2005, nombre: "Javier Eliud", imagenCarro: "carro1"))
        autos.append(Auto(placas: "KSIU567", marca: "Nissan", modelo: "Tsuru", año: 1998, nombre: "Jorge Luis", imagenCarro: "carro2"))
        autos.append(Auto(placas: "UOUU987", marca: "Dodge", modelo: "Stratus", año: 1996, nombre: "Jose Alberto", imagenCarro: "carro3"))
        autos.append(Auto(placas: "OPPWE234", marca: "Matel", modelo: "Jeep", año: 2004, nombre: "Cesar Roberto", imagenCarro: "carro4"))
        autos.append(Auto(placas: "UIYUW244", marca: "Walmart", modelo: "Carrito de Super", año: 2020, nombre: "Ana Lucia", imagenCarro: "carro5"))
        autos.append(Auto(placas: "IOUER89", marca: "JayJay", modelo: "Avion Feliz", año: 1998, nombre: "Luz Areli", imagenCarro: "carro6"))
        
        
        cargas.append(Gasolina(cantidad: 1, litros: 5, placas: "JHYA892"))
        cargas.append(Gasolina(cantidad: 2, litros: 20, placas: "JHYA892"))
        cargas.append(Gasolina(cantidad: 3, litros: 120, placas: "JHYA892"))
        
        cargas.append(Gasolina(cantidad: 4, litros: 5, placas: "KSIU567"))
        cargas.append(Gasolina(cantidad: 5, litros: 10,placas: "KSIU567"))
        cargas.append(Gasolina(cantidad: 6, litros: 10, placas: "KSIU567"))
        
        cargas.append(Gasolina(cantidad: 7, litros: 5, placas: "UOUU987"))
        cargas.append(Gasolina(cantidad: 8, litros: 2, placas: "UOUU987"))
        cargas.append(Gasolina(cantidad: 9, litros: 3, placas: "UOUU987"))
        
        cargas.append(Gasolina(cantidad: 10, litros: 10, placas: "OPPWE234"))
        cargas.append(Gasolina(cantidad: 11, litros: 13,placas:"OPPWE234"))
        cargas.append(Gasolina(cantidad: 12, litros: 67, placas: "OPPWE234"))
        
        cargas.append(Gasolina(cantidad: 13, litros: 12,placas: "UIYUW244"))
        cargas.append(Gasolina(cantidad: 14, litros: 5, placas: "UIYUW244"))
        cargas.append(Gasolina(cantidad: 15, litros: 8, placas: "UIYUW244"))
        
        cargas.append(Gasolina(cantidad: 16, litros: 9, placas: "IOUER89"))
        cargas.append(Gasolina(cantidad: 17, litros: 4, placas: "IOUER89"))
        cargas.append(Gasolina(cantidad: 18, litros: 6, placas: "IOUER89"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autos.count
    }
    
    func agregar(auto: Auto) {
        autos.append(auto)
        tvAutos.reloadData()
    }
    
    func agregarCarga(carga: Gasolina){
        cargas.append(carga)
    }

    func recargarTabla(){
        tvAutos.reloadData()
    }
    func eliminarCargas(posicion: Int){
        cargas.remove(at: posicion)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAutos") as? CeldaAutoController
        celda?.imgCarro.image = UIImage(named: autos[indexPath.row].imagenCarro!)
        celda?.lblAño.text = "\(autos[indexPath.row].año!)"
        celda?.lblNombre.text = autos[indexPath.row].nombre!
        celda?.lblPlacas.text = autos[indexPath.row].placas!
        celda?.lblMarca.text = autos[indexPath.row].marca!
        celda?.lblModelo.text = autos[indexPath.row].modelo!
        return celda!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar"{
            let destino = segue.destination as? EditarAutoController
            destino?.auto = autos[tvAutos.indexPathForSelectedRow!.row]
            destino?.cargas = cargas
            destino?.callbackActualizarTabla = recargarTabla
            destino?.callbackAgregarCarga1 = agregarCarga
            destino?.callbackEliminarCarga = eliminarCargas
        }else if segue.identifier == "goToAgregar"{
            let destino = segue.destination as? AgregarAutoController
            destino?.callbackAgregar = agregar
            }
        }
  
    }



