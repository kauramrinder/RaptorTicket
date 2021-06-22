//
//  ManagerViewController.swift
//  Raptor_Ticket_Application
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.
//

import UIKit

class ManagerViewController : UIViewController{
    
    var ticket : [TicketModel] = [];
    var detailedHistory  : [DetailViewModel] = []
     
    
    override func viewDidLoad() {
        print(detailedHistory)
        print(ticket)
           super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "managerToHistorySegue"{
            (segue.destination as! HistoryViewController).detailedHistory = detailedHistory
        }
        else if segue.identifier == "managertoResetsegue"{
            (segue.destination as! ResetViewController).ticketModel = ticket
        }
        
        
    }
    
    
}

