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
    
    var restrunList: [(name:String , link:URL)] = []
    
    var restrunURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //LocationManagerの生成
        myLocationManager.delegate = self
        
        //位置情報の取得を開始する。
        myLocationManager.startUpdatingLocation()
        
        //位置情報使用許可のリクエストを表示するメソッドの呼び出し
        myLocationManager.requestWhenInUseAuthorization()
        
        // API先指定
        var req_url = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=27917f270acba305b505d2dac2c6528f&format=json&latitude=35.181446&longitude=136.906398&range=1")!

        
        print(req_url)
        
        // リクエストに必要な情報を生成
        let req = URLRequest(url: req_url)
        
        // データ転送を管理するめのセッションを生成
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        // リクエストをタスクとして登録
        let task = session.dataTask(with: req, completionHandler: {
            (data , response , error) in
            
            //セッションを終了
            session.finishTasksAndInvalidate()
            
            // do try catch エラーハンドリング
            do {
                //JSONDecoderのインスタンス取得
                let decoder = JSONDecoder()
                
                // 受け取ったJSONデータをパース（解析）して格納
                let json = try decoder.decode(Response.self, from: data!)
                
                //print(json)
                
                // お菓子の情報が取得できているか確認
                if let restruns = json.rest {

                    // お菓子のリストを初期化
                    self.restrunList.removeAll()
                    
                    // 取得しているお菓子の数だけ処理
                    for rest in restruns {
                       
                        // お菓子の名称、メーカー名、掲載URL、画像URLをアンラップ
                       
                        if let name = rest.name , let link = rest.url {
                            // １つのお菓子をタプルでまとめて管理
                            let Restrun = (name, link)
                            // お菓子の配列へ追加
                            self.restrunList.append(Restrun)
                        }
                    }
                    // Table Viewを更新する
                    self.tableView.reloadData()
                    
                    if let restrundbg = self.restrunList.first {
                        print ("----------------")
                        print ("restrunList[0] = \(restrundbg)")
                    }
                }
            } catch {
                // エラー処理
                print("エラーが出ました")
            }
        })
        // ダウンロード開始
        task.resume()
        
        /*var reqest = NSURLRequest(URL: url)
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
        })*/
    }
    
    // Cellの総数を返すdatasourceメソッド、必ず記述する必要があります
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // お菓子リストの総数
        return restrunList.count
    }
    
    // Cellに値を設定するdatasourceメソッド。必ず記述する必要があります
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 今回表示を行う、Cellオブジェクト（１行）を取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "restrunCell", for: indexPath)
        
        // お菓子のタイトル設定
        cell.textLabel?.text = restrunList[indexPath.row].name
        
        // 設定済みのCellオブジェクトを画面に反映
        return cell
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
    
  //JSONのrest内のデータ構造
    struct Rest: Codable{
        //お店の名前
        let name: String?
        //お店のURL
        let url: URL?
    }
    //JSONのデータ構造
    struct Response: Codable{
        let total_hit_count: Int?
        let hit_par_page: Int?
        let rest: [Rest]?
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
