//
//  ViewController.swift
//  Raptor_Ticket_Application
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.


import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var pickerViewData:[TicketModel] = [TicketModel]()
    var ticketQuantity: String = ""
    var ticketPrice: Double = 0.0
    var detailViewModel : [DetailViewModel] = [DetailViewModel]()
    var ticketModel : TicketModel?;
    var selectedRow : Int = 0;
    

    @IBOutlet weak var lblTicketType: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var lblQuantity: UILabel!
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerViewData.count
    }
    
    
    //title for each row generated
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        selectedRow = row;
        ticketPrice = pickerViewData[row].ticketPrice
        return "\(pickerViewData[row].ticketName) \(pickerViewData[row].ticketQuantity) Price:: \(pickerViewData[row].ticketPrice) $"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let ticketQuantityy : Double = Double(ticketQuantity)!
        lblTicketType.text = pickerViewData[row].ticketName
        lblTotalPrice.text = "\(ticketQuantityy * ticketPrice)"
        
    }
    
    
    @IBAction func quantityPressed(_ sender: UIButton) {
        ticketQuantity += sender.currentTitle ?? ""
        lblQuantity.text = ticketQuantity
        
    }
    
    @IBAction func buttonBuyPressed(_ sender: Any) {
        let ticketQuantityy : Double = Double(ticketQuantity)!
        if ticketQuantityy >  Double(pickerViewData[selectedRow].ticketQuantity) {
            lblTotalPrice.text = "Not Enough Tickets!!!"
        }
        else{
            lblTotalPrice.text = "\(ticketQuantityy * ticketPrice)"
            let ticketQuantityy : Double = Double(ticketQuantity)!;
            var labelTxt = lblTicketType.text;
            if lblTicketType.text == ""{
                labelTxt = pickerViewData[selectedRow].ticketName
            }
            detailViewModel.append(DetailViewModel(ticketName: labelTxt ?? "",quantity: Int(lblQuantity.text ?? "") ?? 0,total: Double(lblTotalPrice.text ?? "") ?? 0 ,purchaseDate: Date()))
            pickerViewData[selectedRow].ticketQuantity = pickerViewData[selectedRow].ticketQuantity - Int(ticketQuantityy)
            picker.reloadAllComponents()
        }
        
        ticketQuantity = "";
        lblQuantity.text = "";
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerViewData.append(TicketModel(ticketName: "Balcony Level Ticket",price: 1170,quantity: 12))
        pickerViewData.append(TicketModel(ticketName: "Lower Level Ticket", price: 10434,quantity: 20))
        pickerViewData.append(TicketModel(ticketName: "Courtside",price: 27777,quantity: 15))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! ManagerViewController).detailedHistory = detailViewModel
        (segue.destination as! ManagerViewController).ticket = pickerViewData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        picker.reloadAllComponents()
    }


}

