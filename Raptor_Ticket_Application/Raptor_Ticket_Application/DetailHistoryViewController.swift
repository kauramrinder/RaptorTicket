
//  DetailHistoryViewController.swift
//  Raptor_Ticket_Application
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.//

import UIKit

class DetailHistoryViewController : UIViewController{

    @IBOutlet weak var lblTicketQuantity: UILabel!
    @IBOutlet weak var lblTicketName: UILabel!
    @IBOutlet weak var lblTicketPurchaseDate: UILabel!
    @IBOutlet weak var lblTicketTotalPrice: UILabel!
    
    var detailedHistory : DetailViewModel?;

    override func viewDidLoad() {
        
        let quantity : Int = detailedHistory?.ticketQuantity ?? 0
        let totalAmount : Double = detailedHistory?.Amount ?? 0
        let datePurchased : Date = detailedHistory?.purchaseDate ?? Date()
        let ticketName : String = detailedHistory?.ticketName ?? ""
        
        super.viewDidLoad()
        
        lblTicketName.text = "\(ticketName)"
        lblTicketQuantity.text = "\(quantity)"
        lblTicketPurchaseDate.text = "\(datePurchased)"
        lblTicketTotalPrice.text = "\(totalAmount)"
        
       }
}
