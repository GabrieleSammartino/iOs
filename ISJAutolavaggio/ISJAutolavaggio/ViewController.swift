//
//  ViewController.swift
//  ISJAutolavaggio
//
//  Created by zoesierra on 26/05/17.
//  Copyright © 2017 zoesierra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var AutoArrived: UILabel!
    
    var listOfCars =  [AutoModel]()
    var arrayOfRamdomIndex = [Int]()
    
    var indexOfMinCar = 0
    
    var numOFCarsToGenerate = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("Dentro chooseCarToWash")
        
        self.AutoArrived.text = "Sono arrivate 3 Auto"
        //self.arrayOfRamdomIndex = [2, 0, 1]
        
        self.generateCars(num: numOFCarsToGenerate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        if(self.listOfCars.count == self.numOFCarsToGenerate){
            self.AutoArrived.text = "Sono arrivate \(self.listOfCars.count) Auto"
        }
        else {
            self.AutoArrived.text = "Restano \(self.listOfCars.count) Auto da lavare"
        }
        
    }
    
    func generateCars(num : Int){
        print ("Dentro generateCars")
        print ("Genero \(num) auto")
        
        for index in 1...num {
            print ("Genero \(index) auto")
            
            let name = "Car_"+"\(index)"
            //let order = self.arrayOfRamdomIndex[index]
            let order = generateRandomIndex(num: num)
            let car = self.geretaOneCar(name: name, order: order)
            self.listOfCars.append(car)
        }
        print ("Le atuot gnerate sono : \(self.listOfCars.count)")
    }
    
    
    
    func generateRandomIndex (num : Int)-> (Int){
    
        var result = 0
        
        let tmpRandomIndex = Int(arc4random_uniform(UInt32(num)) )
        print ("tmpRandomIndex =  \(tmpRandomIndex)")
        
        // se il numero genrato non è ancora stato utilizzato allora lo uso per la mia car e lo inseriscon dentro l'
        if !(arrayOfRamdomIndex.contains(tmpRandomIndex)) {
            result = tmpRandomIndex
            self.arrayOfRamdomIndex.append(tmpRandomIndex)
        }
        else {
             result = generateRandomIndex(num: num)
        }
        
        print ("result = \(result)")
        
        return result
        
    }
    
    
    
    func geretaOneCar (name : String , order :Int) -> (AutoModel){
        let car = AutoModel()
        car.name = name
        car.time = order
        
        return car
    }
    

    
    @IBAction func ChooseCar(_ sender: Any) {
        
        print ("Dentro ChooseCar")
        // selezionare l'auto con l'ordine di arrivo minore e portarlo alla prossima vista
        self.chooseCarToWash()
    }

    
    func chooseCarToWash (){
        print ("Dentro chooseCarToWash")
        
        // serve trovare l'auto con time minore
        
        var min = 1000
        var x = 0;
        
        for item in self.listOfCars{
            // in item ho un' oggetto auto
            print ("auto corrente.name = \(item.name!)")
            print ("auto corrente.time = \(item.time!)")
            
            if(item.time! <= min){
                min = item.time!
                indexOfMinCar = x
                self.indexOfMinCar = x
            }
            x+=1
        }
        
        // andare alla prossima view
        
        if(self.listOfCars.count > 0 ){
            self.performSegue(withIdentifier: "washingCar", sender: self)
        }
        else{
            print("Non ci sono più auto da lavare")
            return
        }
        
    }

    
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        /*
        guard let identifier = segue.identifier else {
            print("il segue non ha un identifier, esco dal prepareForSegue")
            return
        }
        */
        
        if(self.listOfCars.count > 0 ){
            let carForSegue = self.listOfCars[self.indexOfMinCar]
            let secondVC = segue.destination as! SecondViewController
            secondVC.carToWash = carForSegue
            self.listOfCars.remove(at: self.indexOfMinCar)
        }
        else{
            print("il segue non ha un identifier, esco dal prepareForSegue")
            return
        }
     }
}

