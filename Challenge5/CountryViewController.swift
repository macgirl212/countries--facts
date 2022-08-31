//
//  CountryViewController.swift
//  Challenge5
//
//  Created by Melody Davis on 8/30/22.
//

import UIKit
import WebKit

class CountryViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Country?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else {
            return
        }
        
        let html = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                    h1 {
                        text-align: center;
                    }
                    img {
                        display: block;
                        margin: 20px auto;
                        border: 1px solid grey
                    }
                    table, th, td {
                        border: 1px solid black;
                    }
                    th, td {
                        padding-left: 5px;
                        padding-right: 5px;
                    }
                    th {
                        text-align: right;
                    }
                </style>
            </head>
            <body>
                <h1>\(detailItem.name)</h1>
                <img src="https://countryflagsapi.com/png/\(detailItem.unCode)" />
                <table>
                    <tr>
                        <th>Capital:</th>
                        <td>\(detailItem.capital)</td>
                    </tr>
                    <tr>
                        <th>Official Languages:</th>
                        <td>\(detailItem.officialLanguages.joined(separator: ", "))</td>
                    </tr>
                    <tr>
                        <th>Land Area:</th>
                        <td>\(detailItem.landArea) square miles</td>
                    </tr>
                    <tr>
                        <th>Water (%):</th>
                        <td>\(detailItem.waterPercentage)%</td>
                    </tr>
                    <tr>
                        <th>Population:</th>
                        <td>\(detailItem.population)</td>
                    </tr>
                    <tr>
                        <th>Currency:</th>
                        <td>\(detailItem.currency.joined(separator: ", "))</td>
                    </tr>
                    <tr>
                        <th>Driving Side:</th>
                        <td>\(detailItem.drivingSide)</td>
                    </tr>
                    <tr>
                        <th>Calling Code:</th>
                        <td>\(detailItem.callingCode.joined(separator: ", "))</td>
                    </tr>
                </table>
            </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }

}
