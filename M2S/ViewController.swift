//
//  ViewController.swift
//  M2S
//
//  Created by iorin on 2018/04/12.
//  Copyright © 2018年 iorin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    var myLocationManager: CLLocationManager!
    
    
    @IBOutlet weak var testMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LocationManagerの生成
        myLocationManager = CLLocationManager()
        
        //位置情報使用許可のリクエストを表示するメソッドの呼び出し
        myLocationManager.requestWhenInUseAuthorization()
        
        }
    
    //位置情報取得に失敗したときに呼び出されるメソッド
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")

      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

