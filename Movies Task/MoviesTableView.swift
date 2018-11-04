
//  MoviesCell.swift
//  Movies Task
//
//  Created by Mohamed Ali on 11/2/18.
//  Copyright © 2018 mohamed ali. All rights reserved.
//

import UIKit

class MoviesTableView: UITableViewCell , UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    
    var moviesArray : [[String:Any]]?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the delegate and datasource to self
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
        
        self.getCountries()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moviesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        
        let Movie = self.moviesArray?[indexPath.row]
        cell.textLabel?.text = Movie?["name"] as? String ?? "mafeesh"
        return cell
        
        
    }
    
    func getCountries() {
        
        let headers = [
            "cache-control": "no-cache"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=b6005b0ca5c8da082257ea8146eca273&fbclid=IwAR19-DGdxQpal3oiHXIFbVsEsasC4BnuvpmYjTMTGXGvqgE_ls_wXeqGZtIk")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                do {
                    // parse response to an array
                    let moviesArray = try JSONSerialization.jsonObject(with: data!, options:[])
                    
                    self.moviesArray
                    = moviesArray as? [[String:Any]]
                    
                    // perform changes on UI on MAIN thread
                    DispatchQueue.main.async {
                        
                        // reload dtable view to call delegate functions again
                        self.MoviesTableView.reloadData()
                        moviesTableView               }
                } catch let parseError as NSError {
                    print("Error with Json: \(parseError)")
                }
            }
        })
        
        dataTask.resume()
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
