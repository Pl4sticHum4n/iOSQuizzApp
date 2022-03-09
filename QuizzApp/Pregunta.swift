//
//  Pregunta.swift
//  QuizzApp
//
//  Created by mac16 on 08/03/22.
//

import Foundation

struct Pregunta {
    let texto: String
    let respuesta: String
    
    init(t: String, r: String){
        texto = t
        respuesta = r
    }
}
