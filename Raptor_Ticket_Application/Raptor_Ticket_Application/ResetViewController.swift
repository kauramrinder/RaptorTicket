//
//  ResetViewController.swift
//  Raptor_Ticket_Application
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.
//

import UIKit

class ResetViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var ticketModel : [TicketModel] = [];
    
    var selectedRow = 0;
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        
        ticketModel[selectedRow].ticketQuantity = Int(txtTicketQuantity.text!) ?? 0
        
        picker.reloadAllComponents()
        
       view.endEditing(true)
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        txtTicketQuantity.text = ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return ticketModel.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
         return 1
    }
      

    @IBOutlet weak var txtTicketQuantity: UITextField!
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return "\(ticketModel[row].ticketName) \(ticketModel[row].ticketQuantity) Price: \(ticketModel[row].ticketPrice) $"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedRow = row;
        self.title = ticketModel[row].ticketName
        
    }
    
     override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}
