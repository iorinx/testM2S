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
    
   // var latitude = 35.181446
   // var longitude = 136.906398
    
     //https://apvarnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=1
    
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
     
     
         /* myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
          myLocationManager.distanceFilter = kCLDistanceFilterNone
     
          //LocationManagerの生成
          myLocationManager.delegate = self
        
          //位置情報の取得を開始する。
          myLocationManager.startUpdatingLocation()
        
          //位置情報使用許可のリクエストを表示するメソッドの呼び出し
          myLocationManager.requestWhenInUseAuthorization()
        
          // MapViewを生成.
         //let myMapView: MKMapView = MKMapView()
         // myMapView.frame = self.view.frame
          
          //中心座標と表示範囲をマップに登録する。
         // let region = MKCoordinateRegionMake(center, span)
          //testMapView.setRegion(region, animated:true)
     
          // MapViewにregionを追加.
          //testMapView.region = region
     
          // viewにMapViewを追加.
         // self.view.addSubview(testMapView)
     
          //let myPin: MKPointAnnotation = MKPointAnnotation()
     
          // 座標を設定.
          //myPin.coordinate = center
     
          // MapViewにピンを追加.
          //testMapView.addAnnotation(myPin)*/
        
     }
     
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          print("error")
     }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func range300Button(_ sender: Any) {
          func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
          
          //詳細画面を取得する
          let detailViewController = segue.destination as! DetailViewController
          
          //詳細画面に表示するURL名を生成
          let detailURLName = NSURL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=1")
          //詳細画面にURLを渡す
          detailViewController.restrunURL = detailURLName
     }
     
     }
    
    @IBAction func range500Button(_ sender: Any) {

          func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
          
               //詳細画面を取得する
               let detailViewController = segue.destination as! DetailViewController
          
               //詳細画面に表示するURL名を生成
               let detailURLName = NSURL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=2")
               //詳細画面にURLを渡す
               detailViewController.restrunURL = detailURLName
          }
    }
    
    @IBAction func range1000Button(_ sender: Any) {
     
          func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
          
               //詳細画面を取得する
               let detailViewController = segue.destination as! DetailViewController
          
               //詳細画面に表示するURL名を生成
               let detailURLName = NSURL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=3")
               //詳細画面にURLを渡す
               detailViewController.restrunURL = detailURLName
          }
     }
    }
    
    


