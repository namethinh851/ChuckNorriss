//
//  ViewController.swift
//  ChuckNorriss
//
//  Created by Ted Lam on 9/15/16.
//  Copyright © 2016 Ted Lam. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeQuote: UIButton!
    @IBOutlet weak var author: UILabel!
    
    
    let chuckSource = FactsSource()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        chuckSource.callAlamo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func changeText(){
        chuckSource.callAlamo()
        label.text = chuckSource.quote
        [self .viewDidLoad()]
    }
    
    func changeColor(){
        let color = Color()
        view.backgroundColor = color.changeColor()
        changeQuote.tintColor = color.changeColor()
    }
    
    @IBAction func changeQuote(_ sender: UIButton) {
        changeColor()
        changeText()
    }

}

