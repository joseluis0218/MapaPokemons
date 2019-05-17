//
//  Funciones.swift
//  PokemonGo
//
//  Created by Jose Luis Cristobal on 17/05/19.
//  Copyright © 2019 Jose Luis Cristobal. All rights reserved.
//

import UIKit
import CoreData

func agregarPokemons(){
    crearPokemon(xnombre : "Mew", ximagenNombre: "mew")
    crearPokemon(xnombre: "Meowth", ximagenNombre: "meowth")
    crearPokemon(xnombre: "Abra", ximagenNombre: "abra")
    crearPokemon(xnombre: "Bullbasaur", ximagenNombre: "bullbasaur")
    crearPokemon(xnombre: "Dratini", ximagenNombre: "dratini")
    crearPokemon(xnombre: "Eevee", ximagenNombre: "eevee")
    crearPokemon(xnombre: "Mankey", ximagenNombre: "mankey")
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}
func crearPokemon(xnombre:String, ximagenNombre:String){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context:context)
    pokemon.nombre = xnombre
    pokemon.imagenNombre = ximagenNombre
}

func obtenerPokemons() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do{
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        if pokemons.count == 0 {
            agregarPokemons()
            return obtenerPokemons()
        }
        return pokemons
    }catch{}
    return []
}
func obtenerPokemonsAtrapados() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let queryConWhere = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    queryConWhere.predicate = NSPredicate(format: "atrapado == %@", true as CVarArg)
    do{
        let pokemons = try context.fetch(queryConWhere) as [Pokemon]
        return pokemons
    }catch{}
    return []
}
func obtenerPokemonsNoAtrapados() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let queryConWhere = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    queryConWhere.predicate = NSPredicate(format: "atrapado == %@", true as CVarArg)
    do{
        let pokemons = try context.fetch(queryConWhere) as [Pokemon]
        return pokemons
    }catch{}
    return []
}
