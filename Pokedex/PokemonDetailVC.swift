//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Vidur Singh on 31/08/16.
//  Copyright © 2016 Vidur Singh. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var defenseLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var pokedexIdLbl: UILabel!
    

    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var evoLbl: UILabel!
    
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var baseAttackLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLbl.text = pokemon.name
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            
            // this will be called after downloading Data
            
         
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
       

        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true

        } else {
            
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                
                str += " - LVL \(pokemon.nextEvolutionLvl) "
                 evoLbl.text = str
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
