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
                    h1, h2, p {
                        text-align: center;
                    }
                    img {
                        display: block;
                        margin: 20px auto;
                        border: 1px solid grey;
                        max-width: 100%;
                    }
                    table {
                        display: block;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 40px;
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
                    figure {
                        padding: 1px 10px 15px 10px;
                        border: 1px solid lightgrey;
                        background-color: aliceblue;
                        margin-bottom: 40px;
                    }
                    figcaption {
                        font-size: 1.4em;
                        font-style: bold;
                        text-align: center;
                    }
                    #motto {
                        font-size: 1.4em;
                        font-style: italic;
                    }
                </style>
            </head>
            <body>
                <h1>\(detailItem.name)</h1>
                <img src="https://countryflagsapi.com/png/\(detailItem.unCode)" alt="\(detailItem.demonyn[0]) flag" />
                <p id="motto">\(detailItem.motto)</p>
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
                        <th>Demonyn:</th>
                        <td>\(detailItem.demonyn.joined(separator: ", "))</td>
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
                <hr />
                <h2>National Food of \(detailItem.name)</h2>
                <figure>
                    <img src="\(detailItem.nationalFoodURL)" alt="image of \(detailItem.nationalFood)" />
                    <figcaption>\(detailItem.nationalFood)</figcaption>
                </figure>
                <p>For more information, please visit its <a href="https://en.wikipedia.org/wiki/\(detailItem.wikiPath)">Wiki page</a>.</p>
            </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }

}
