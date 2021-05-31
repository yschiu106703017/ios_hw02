//
//  ViewController2.swift
//  Assigment2
//
//  Created by 邱奕修 on 2021/4/15.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var airport: Airport?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tableveiw: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableveiw.delegate = self
        tableveiw.dataSource = self
        title = airport?.IATA
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportDetailCell", for: indexPath) as! AirportDetail
        img.image = UIImage(named: airport?.imageName ?? "")
        switch indexPath.row {
        case 0:
            cell.key.text = "Name"
            cell.value.text = airport?.name
        case 1:
            cell.key.text = "Location"
            cell.value.text = "\(airport?.servedCity ?? ""), \(airport?.country ?? "")"
        case 2:
            cell.key.text = "IATA"
            cell.value.text = airport?.IATA
        case 3:
            cell.key.text = "ShortName"
            cell.value.text = airport?.shortName
        default:
            break
        }
        
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
