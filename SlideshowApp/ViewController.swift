//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 藪広樹 on 2018/02/19.
//  Copyright © 2018年 torikabuto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //UIImageの呼び出し
    @IBOutlet weak var imageView: UIImageView!
    
    //タイマーの変数を宣言
    var timer : Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    /// 表示している画像の番号
    var dispImageNo = 0
 
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 画像の名前の配列
        let imageNameArray = [
            "1.jpg","2.jpg","3.jpg",
        ]
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2{
        dispImageNo = 0
        }
        // 表示している画像の番号から名前を取り出す
        let imageName = imageNameArray[dispImageNo]
        //画像を読み込み
        let image = UIImage(named: imageName)
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        //画像1を読み込み
    let image = UIImage(named: "1.jpg")
    //画像を表示
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    /// Timerによって、一定の間隔で呼び出される関数
    func onTimer(timer:Timer){
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }

    @IBOutlet weak var startstopOutlet: UIButton!
    //進むボタン
    @IBAction func goButton(_ sender: Any) {
        if self.timer == nil{
        //dispImageNoに1を足す
        dispImageNo += 1
        displayImage()
        }
    }
   //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        if self.timer == nil{
        //dispImageNoから1を引く
        dispImageNo -= 1
        displayImage()
        }
    }
    
    //再生・停止ボタン
    @IBAction func startstopButton(_ sender: Any) {
        if self.timer == nil{
            //タイマーが動いている時に”停止”と表示
          startstopOutlet.setTitle("停止", for: .normal)
            // タイマーの作成、始動（２秒間隔）
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
            
        }
        else{
            //タイマーが止まっているときに”再生”と表示
              startstopOutlet.setTitle("再生", for: .normal)
            
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // Timer() の timer == nil で判断するために、 timer = nil としておく
            
        }
    }
    //画像にかかったボタンが押された際にタイマーを停止させる
    @IBAction func imageButton(_ sender: Any) {
        if self.timer != nil{
            //タイマーが止まっているときに”再生”と表示
            startstopOutlet.setTitle("再生", for: .normal)
            self.timer.invalidate()  // 現在のタイマーを破棄する
            self.timer = nil          // Timer() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているimageNoに値を代入して渡す
        resultViewController.imageNo = dispImageNo
    }
    
    //別画面からボタンを押すと戻ってくる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

