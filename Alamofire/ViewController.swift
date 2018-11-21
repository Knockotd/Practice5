//
//  ViewController.swift
//  Alamofire
//
//  Created by 503-26 on 20/11/2018.
//  Copyright © 2018 TheJoeun. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let request = Alamofire.request("https://www.daum.net", method:.get, parameter:nil)
        request.response{
            response in
            let msg = NSString(data: request.data, encoding: String.Encoding.utf8.rawValue)
            print(msg)
        }
    }


}

