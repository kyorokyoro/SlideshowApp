//
//  ResultsViewController.swift
//  SlideshowApp
//
//  Created by 久保田恭介 on 10/02/2017.
//  Copyright © 2017 kyorokyoro. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
   
    @IBOutlet weak var back: UIButton!

    @IBOutlet weak var larger: UIImageView!
    
    var largerImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        larger.image = largerImage
  }

    override func didReceiveMemoryWarning() {
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
