//
//  DetailViewController.swift
//  M2S
//
//  Created by iorin on 2018/04/13.
//  Copyright © 2018年 iorin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class DetailViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var myLocationManager: CLLocationManager = CLLocationManager()
    
    var restrunList: [(maker:String, name:String , link:NSURL)] = []
    
    var restrunURL: NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //LocationManagerの生成
        myLocationManager.delegate = self
        
        //位置情報の取得を開始する。
        myLocationManager.startUpdatingLocation()
        
        //位置情報使用許可のリクエストを表示するメソッドの呼び出し
        myLocationManager.requestWhenInUseAuthorization()
        
        
    //    self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
      //  let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
      //  self.navigationItem.rightBarButtonItem = addButton
        
        // API先指定
        var url = NSURL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=1")
        
        var reqest = NSURLRequest(URL: url as! URL )
        NSURLConnection.sendAsynchronousRequest(reqest,queue:NSOperationQueue.mainQueue(),completionHandler:{
            (res: NSURLResponse!, data: NSData!, error: NSError!) in
            let json = JSONValue(data)
            
            if let url = json["results"]["salon"][0]["urls"]["pc"].string{
                println(url)
                self.url = url
            }
            
            if let image = json["results"]["salon"][0]["mood"][0]["photo"].string{
                println(image)
            }
            if let caption = json["results"]["salon"][0]["mood"][0]["caption"].string{
                println(caption)
                
            }
        })
        
       /* let RESURL: NSURLComponents? = NSURLComponents(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=3")
        //リクエストに必要な情報を生成

        let req = NSURLRequest(url: restrunURL! as URL)
        
        let url = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=3")!
        //let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = URLSession.shared.dataTask(with: url, MTLNewLibraryCompletionHandler: {(data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                          print(json)
                    }
                }catch {
                }
            }
        })
        task.resume()
        // Do any additional setup after loading the view. */
        
   /*     let url: URL = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=1")!
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { (data, response, error) in
            
            if error != nil {
                
                //print(error!.localizedDescription)
            } else {
                
               let json = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                
               print(json)
                
               //let json = try decoder.decode(response.self, from data!)
            }
            
        })
        task.resume() *?
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        for location in locations{
    
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
          
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 /*  //JSONのrest内のデータ構造
    struct Rest: Codable{
        //お店の名前
        let name: String?
        //お店の緯度・経度
        let latitude: Double?
        let longitude: Double?
        //お店のURL
        let url: NSURL?
    }
    //JSONのデータ構造
    struct Response: Codable{
        let total_hit_count: Int?
        let hit_par_page: Int?
        let rest: [Rest]?
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
