//
//  DetailViewModel.swift
//  Raptor_Ticket_App
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.
//

import Foundation

class DetailViewModel{
    var ticketName : String;
    var ticketQuantity : Int;
    var Amount : Double;
    var purchaseDate : Date;
    
    init(ticketName:String, quantity:Int, total:Double, purchaseDate:Date){
        self.ticketName = ticketName;
        self.ticketQuantity = quantity;
        self.Amount = total;
        self.purchaseDate = purchaseDate;
    }
}
