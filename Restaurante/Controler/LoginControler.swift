//
//  LoginControler.swift
//  Restaurante
//
//  Created by user260925 on 7/16/24.
//

import Foundation
import UIKit
import SwiftUI

class LoginControler: UIViewController
{
    @IBOutlet weak var UsuarioTXT : UITextField!
    @IBOutlet weak var PassTXT : UITextField!
    @IBOutlet weak var InicioBTN: UIButton!
    
    struct Usuarios: Decodable{
        var resultados: [Usuario]
    }
    struct Usuario: Decodable
    {
        var Nombre: String
        var Usuario: String
        var Contraseña: String
        var Correo: String
        var Telefono: String
        var Genero: String
        var Ocupacion: String
        var Edad: Int
    }
    struct ContentView: View{
        var body: some View
        {
            Text("Hola")
                .padding()
        }
    }
    var User = [Usuario]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func Logeado(_ sender: UIButton) {
    var Valor: Bool = validaLogin()
        if Valor
        {
            UIStoryboardSegue.self
        }else
        {
            print("Error")
        }
    }
    func validaLogin () -> Bool {
        var usuario = UsuarioTXT.text
        var contraseña = PassTXT.text
        if (usuario == "")
        {
            print("Alguno de los valores requeridos esta vacio")
        }
        else if (contraseña == "")
        {
            print("Alguno de los valores requeridos esta vacio")
        }else
        {
            print("Usuario \(usuario) y Contraseña \(contraseña)")
            return true
        }
        return false
        
    }
    private func leerjson()
    {
        if let url = Bundle.main.url(forResource: "Usuarios", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            if let datos = try? decoder.decode(Usuarios.self, from: data)
            {
                User = datos.resultados
                //UsuarioTXT.text = User[0].Usuario
            }
        }
    }
}
