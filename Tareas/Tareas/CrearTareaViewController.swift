//
//  CrearTareaViewController.swift
//  Tareas
//
//  Created by Tecsup on 24/04/17.
//  Copyright © 2017 Tecsup. All rights reserved.
//

import UIKit

class CrearTareaViewController: UIViewController {

    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    
    var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func agregar(_ sender: Any) {
        let tarea = Tarea()
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImportante.isOn
        
        anteriorVC.tareas.append(tarea)
        anteriorVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
