//
//  ViewController.swift
//  Challenge5
//
//  Created by Melody Davis on 8/30/22.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries' Facts"
        
        if let path = Bundle.main.path(forResource: "countriesJSON", ofType: "json") {
            if let jsonData = try? String(contentsOfFile: path).data(using: .utf8) {
                parse(json: jsonData)
                return
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonCountries = try? decoder.decode([Country].self, from: json) {
            countries = jsonCountries
            tableView.reloadData()
            print(countries)
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CountryViewController()
        vc.detailItem = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

