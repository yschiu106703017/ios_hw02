//
//  ViewController.swift
//  Assigment2
//
//  Created by CHI on 2021/4/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var airports: [Airport] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        title = "Airport List"
        fetchData()
        //print(airports)
        
        // start here...
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath) as! AirportCell
        cell.shortName.text = airports[indexPath.row].shortName
        cell.country.text = airports[indexPath.row].country
        cell.img.image = UIImage(named: airports[indexPath.row].imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(airports[indexPath.row])
        performSegue(withIdentifier: "goForDetail", sender: airports[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goForDetail":
            let data = sender as? Airport
            if let nextPage = segue.destination as? ViewController2{
                nextPage.airport = data
            }
        default:
            break
        }
    }
    
    
}


extension ViewController {
    private func fetchData() {
        guard let path = Bundle.main.path(forResource: "airports", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let airports = try? PropertyListDecoder().decode([Airport].self, from: xml) else {
            return
        }
        self.airports = airports
    }
}

