//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 藪広樹 on 2018/02/20.
//  Copyright © 2018年 torikabuto. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //ビューコントローラーアウトレット
    @IBOutlet weak var rvcimageView: UIImageView!
    //ViewControllerから画像番号受け取るための変数
    var imageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageNameArray = [
            "1.jpg","2.jpg","3.jpg",
            ]
        // 表示している画像の番号から名前を取り出す
        let imageName = imageNameArray[imageNo]
        //画像を読み込み
        let image = UIImage(named: imageName)
        // Image Viewに読み込んだ画像をセット
        rvcimageView.image = image

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
