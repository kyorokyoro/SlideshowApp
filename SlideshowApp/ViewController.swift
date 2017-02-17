//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 久保田恭介 on 10/02/2017.
//  Copyright © 2017 kyorokyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    // 画像の名前の配列
    let imageNameArray = [
        "ぷに背景画像候補.jpg",
        "ぷに背景画像候補２.jpg",
        "ぷに背景画像候補３.jpg"
    ]

    var dispImageNo = 0
        // dispimageNoという変数を0で初期化している!
      // 関数を定義している!! するとその後は関数名()で使用することができる!!
    func displayImage() {
    
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }

    @IBAction func onTapImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    @IBAction func moveon(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    @IBAction func goback(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
   
    @IBOutlet weak var move: UIButton!
    
    @IBOutlet weak var back: UIButton!
   
    @IBAction func startandpause(_ sender: UIButton) {
       
        //timerが動いてるなら.
        if timer.isValid == true {
            
            //timerを破棄する.
            timer.invalidate()
            
            //ボタンのタイトル変更.
            sender.setTitle("再生", for: UIControlState.normal)
            
            //ボタンを停止
            move.isEnabled = true
            back.isEnabled = true
          
        }
        else{
            
            //timerを生成する.
              timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.timerHandler), userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
            sender.setTitle("停止", for: UIControlState.normal)

            
            move.isEnabled = false
            back.isEnabled = false
     
    }
        
    }
    
    //タイマーオブジェクトを生成する
    var timer = Timer()
    var imageIndex = 0
    
    
    // タイマー
    func timerHandler() {
        imageIndex += 1
    
        // 画像枚数を超えたのでindexを0に戻す
        if (imageIndex >= imageNameArray.count) {
            imageIndex = 0
        }
        print(">>>>>> index:\(imageIndex)")
        // 次の画像取得
        let image = UIImage(named: imageNameArray[imageIndex])
        
        // 画像切り替え
        imageView.image = image
        
    }
    /// 表示している画像の番号を元に画像を表示する　ロード後の最初の画面
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dispImageNo = 0
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultsViewController:ResultsViewController = segue.destination as! ResultsViewController
        // 遷移先のResultViewControllerで宣言しているnameに値を代入して渡す
        resultsViewController.largerImage = imageView.image!
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }


}

