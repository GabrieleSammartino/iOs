//
//  SecondViewController.swift
//  ISJAutolavaggio
//
//  Created by zoesierra on 26/05/17.
//  Copyright © 2017 zoesierra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var carName: UILabel!
    @IBOutlet var carTimeToArrived: UILabel!
    
    var carToWash =  AutoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if(carToWash.name != nil){
            print ("il nome dell'auto da lavare è : \(carToWash.name!)")
            
            self.carName.text = carToWash.name
            self.carTimeToArrived.text = "\(carToWash.time!)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
