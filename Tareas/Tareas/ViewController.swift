//
//  ViewController.swift
//  Tareas
//
//  Created by Tecsup on 10/04/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var tareas:[Tarea] = []
    var indexSeleccionado:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tareas = crearTareas()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        if tarea.importante{
            cell.textLabel?.text = "⭐️ \(tarea.nombre)"
        } else{
            cell.textLabel?.text = tarea.nombre
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    
    func crearTareas() -> [Tarea]{
        
        let tarea1 = Tarea()
        tarea1.nombre = "Pasear al prro"
        tarea1.importante = false
        
        let tarea2 = Tarea()
        tarea2.nombre = "Comprar verdurar"
        tarea2.importante = true
        
        let tarea3 = Tarea()
        tarea3.nombre = "Go chongaso"
        tarea3.importante = true
        
        return [tarea1, tarea2, tarea3]
        
    }
    
    @IBAction func nuevaTarea(_ sender: Any) {
        
        performSegue(withIdentifier: "agregarSegue", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "agregarSegue" {
            let siguienteVC = segue.destination as! CrearTareaViewController
            siguienteVC.anteriorVC = self
        }
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
            siguienteVC.anteriorVC = self
        }
    }
    
    
    

}

