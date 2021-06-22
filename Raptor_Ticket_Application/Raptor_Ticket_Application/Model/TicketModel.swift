//
//  TicketModel.swift
//  Raptor_Ticket_App
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.
//

import Foundation

class TicketModel{
    var ticketName : String;
    var ticketPrice : Double;
    var ticketQuantity : Int;
    
    init(ticketName:String, price:Double, quantity:Int){
        self.ticketName = ticketName;
        self.ticketPrice = price;
        self.ticketQuantity = quantity;
    }
}
