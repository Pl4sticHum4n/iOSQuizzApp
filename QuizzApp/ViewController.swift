//
//  ViewController.swift
//  QuizzApp
//
//  Created by mac16 on 07/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var puntajeLbl: UILabel!
    @IBOutlet weak var preguntaLabel: UILabel!
    @IBOutlet weak var verdaderoButton: UIButton!
    @IBOutlet weak var falsoButton: UIButton!
    @IBOutlet weak var barraProgreso: UIProgressView!
    
    let preguntas = [
        Pregunta(t: "Diez mas diez es veinte", r: "Verdadero"),
        Pregunta(t: "El tec esta re feo", r: "Verdadero"),
        Pregunta(t: "El america trae buen equipo", r: "Falso"),
        Pregunta(t: "La raiz cuadrada de 3 es 10", r: "Falso"),
        Pregunta(t: "Morelia no tiene ningun bache", r: "Falso"),
        Pregunta(t: "9 es un numero primo", r: "Falso"),
        Pregunta(t: "La tecla 8 esta abajo de la /", r: "Verdadero"),
        Pregunta(t: "El lago de Patzcuaro esta limpio", r: "Falso"),
        Pregunta(t: "El puente afuera del tec ya se termino", r: "Falso"),
        Pregunta(t: "Swift es mas facil que Kotlin", r: "Verdadero")
    ]
    
    var numPregunta = 0
    var valorProgres: Float = 0.0
    var aciertos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cambiarPreguta()
    }

    @IBAction func respuestaButton(_ sender: UIButton) {
        let respuestaUser = sender.currentTitle
        let respuestaCorrect = preguntas[numPregunta].respuesta
        
        if respuestaUser == respuestaCorrect {
            print("Correcto")
            aciertos += 1
            print(aciertos)
            puntajeLbl.text = ("Puntaje: \(aciertos)")
            sender.backgroundColor = UIColor.green
        } else {
            print("Incorrecto")
            sender.backgroundColor = UIColor.red
        }
        
        if numPregunta + 1 < preguntas.count {
            numPregunta += 1
        } else {
            let alerta = UIAlertController(title: "Quizz terminado", message: "¡Obtuviste \(aciertos) aciertos!", preferredStyle: .alert)
            let actionOut = UIAlertAction(title: "Salir", style: .destructive){_ in
                print("Salir del Quizz")
                exit(0)
            }
            let actionNg = UIAlertAction(title: "Jugar de nuevo", style: .default){_ in
                self.cambiarPreguta()
            }
            
            alerta.addAction(actionNg)
            alerta.addAction(actionOut)
            
            present(alerta, animated: true, completion: nil)
            numPregunta = 0
            aciertos = 0
        }
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(cambiarPreguta), userInfo: nil, repeats: false)
        
    }
    @objc func cambiarPreguta(){
        puntajeLbl.text = ("Puntaje: \(aciertos)")
        preguntaLabel.text = preguntas[numPregunta].texto
        verdaderoButton.backgroundColor = UIColor.white
        falsoButton.backgroundColor = UIColor.white
        valorProgres = Float(numPregunta + 1) / Float(preguntas.count)
        print(valorProgres)
        barraProgreso.progress = valorProgres
        print(barraProgreso.progress)
    }
}

