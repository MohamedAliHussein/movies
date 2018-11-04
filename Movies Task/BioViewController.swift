//
//  BioViewController.swift
//  Movies Task
//
//  Created by Mohamed Ali on 11/2/18.
//  Copyright © 2018 mohamed ali. All rights reserved.
//

import UIKit

class BioViewController: UIViewController  {
   
    
    
    


    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    
    
    var MyMovies : MyMovies!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = title.name
        
        movieImageView.image = UIImage(named:MyMovies.imageName)
        movieName.text = MyMovies.bio
    
    
    
    
        func viewDidLoad() {
        super.viewDidLoad()

       
    }

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
