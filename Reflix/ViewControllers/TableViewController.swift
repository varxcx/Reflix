//
//  TableViewController.swift
//  Reflix
//
//  Created by Vardhan Chopada on 12/9/22.
//

import UIKit
import BLTNBoard

class TableView: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var cardTableView: UITableView!
    
    var result: Result?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardTableView.dataSource = self
        cardTableView.delegate = self
        cardTableView.allowsSelection = true
        cardTableView.isUserInteractionEnabled = true
        parseJSON()
    }
    
    
    // Defing Protocol Stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.MovieList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieReflix", for: indexPath) as! CustomTableViewCell
        let jitter = result?.MovieList[indexPath.row]
        cell.title.adjustsFontSizeToFitWidth = true
        cell.title.font = UIFont(name: "FeelfreePersonalUse-Regular", size: 32)
        cell.rating.font = UIFont(name: "CreditCard", size: 12)
        cell.year.font = UIFont(name: "CreditCard", size: 12)
        cell.title.text = jitter?.Title
        cell.rating.text = jitter?.Rating
        
        cell.year.text = jitter?.Year
        cell.posterImage.layer.cornerRadius = 30
        cell.posterImage.clipsToBounds = true
        cell.viewUI.layer.cornerRadius = 10
        //Image Network Call
        func setImageFromStringrURL() {
            if let url = URL(string: jitter?.MoviePoster ?? "") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  cell.posterImage.image = UIImage(data: imageData)
              }
            }.resume()
          }
        }
        
        
        setImageFromStringrURL()
        return cell
        
    }
    
    //Defining selection with BLTN
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
        lazy var boardManager: BLTNItemManager = {
             let item = BLTNPageItem(title: "Extras")
             item.actionButtonTitle = "Add to Watchlist"
             item.alternativeButtonTitle = "NAH"
            item.descriptionText = self.result?.MovieList[indexPath.row].Summary
           
            item.actionHandler = { _ in
                TableView.didTapBoardWatchlist()
            }
            item.alternativeHandler = {_ in
                TableView.didTapBoardNah()
            }
             return BLTNItemManager(rootItem: item)
         }()
        boardManager.showBulletin(above: self)
    }
    
    //JSON Parsing
    private func parseJSON() {
        guard let fileLocation = Bundle.main.path(forResource: "Database1", ofType: "json")
        else {
            return
        }
        let url = URL(fileURLWithPath: fileLocation)
        do {
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: data)
            
        }
        catch {
            print(error)
        }
    }
    
    
    //Methods for BLTN Handler
    
    static func didTapBoardWatchlist() {
        
    }
    
    static func didTapBoardNah() {
        
    }
    
}



