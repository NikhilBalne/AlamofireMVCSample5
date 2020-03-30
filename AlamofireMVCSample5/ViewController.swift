//
//  ViewController.swift
//  AlamofireMVCSample5
//
//  Created by iHub on 30/03/20.
//  Copyright © 2020 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callPost()
    }

    func callPost(){
        
    let postsUrl = "featured"
        
    NetworkingClient.networkingClient.excuteGetServiceCall(url:constants.baseUrl+postsUrl, controller:self){ response in
                    
        if response.response?.statusCode == 200 {
        print("StatusCode:\(response.response!.statusCode)")
            
            do {
                            
                let decoder = JSONDecoder()
                let results = try decoder.decode(Features.self, from: response.data!)
                            
//                print("Result:\(results)")
                
                print("BannerCategoryAppsImageName:\(results.bannerCategory?.apps![0].imageName)")
                print("CategoryAppsCategory:\(results.categories![0].apps![0].category)")
                
                } catch let error {
                    print("ErrorDescription:",error.localizedDescription)
                }
                        
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            }
        }
    }

}

