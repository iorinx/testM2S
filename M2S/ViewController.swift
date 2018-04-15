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
    
    var myLocationManager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var testMapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LocationManagerの生成
        myLocationManager.delegate = self
        
        //位置情報の取得を開始する。
        myLocationManager.startUpdatingLocation()
        
        //位置情報使用許可のリクエストを表示するメソッドの呼び出し
        myLocationManager.requestWhenInUseAuthorization()
        
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
        for location in locations{
        //中心座標
        let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        //表示範囲
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        //中心座標と表示範囲をマップに登録する。
        let region = MKCoordinateRegionMake(center, span)
        testMapView.setRegion(region, animated:true)
        
        }
    }
    
    
    //位置情報取得に失敗したときに呼び出されるメソッド
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
        
      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func range300Button(_ sender: Any) {
        print(300)
    }
    
    @IBAction func range500Button(_ sender: Any) {
        print(500)
    }
    
    @IBAction func range1000Button(_ sender: Any) {
        print(1000)
    }
    
    

}

