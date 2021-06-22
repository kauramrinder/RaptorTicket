//
//  HistoryViewController.swift
//  Raptor_Ticket_Application
//
//  Created by user182438 on 10/19/20.
//  Copyright © 2020 user182438(AmrinderKaur). All rights reserved.
//

import UIKit

class HistoryViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var history: UITableView!
    
    var detailedHistory  : [DetailViewModel] = []
    var ticketModel : [TicketModel] = [];
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return detailedHistory.count;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "detailsStoryBoard") as! DetailHistoryViewController;
        
        viewController.detailedHistory = detailedHistory[indexPath.row]
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = history.dequeueReusableCell(withIdentifier: "historyCellId")
        if detailedHistory.count > indexPath.row{
              cell?.textLabel?.text = "\(detailedHistory[indexPath.row].ticketName) \(detailedHistory[indexPath.row].ticketQuantity)"
        }
        else{
             cell?.textLabel?.text = ""
        }
      
        return cell ?? UITableViewCell()
    }
    
    override func viewDidLoad() {
        
           super.viewDidLoad()
       
    }
    
}
