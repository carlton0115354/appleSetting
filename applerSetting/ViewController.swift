//
//  ViewController.swift
//  applerSetting
//
//  Created by 朱家成 on 2022/3/19.
//

import UIKit

class ViewController: UIViewController {
    
    //商品圖片
    @IBOutlet weak var appleImageView: UIImageView!
    //客製化文字部分
    @IBOutlet weak var valueTextField: UILabel!
    
    //RGB文字顯示部分
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    //Slider值
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    //換圖片用陣列(圖片名,X軸,Y軸)
    //未來可直接在這增加東西即可
    var appleImage = ["airprod" , "pencil2"]
    var appleLabelX = [134,134]
    var appleLabelY = [203,160]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //變更文字
    @IBAction func input(_ sender: UITextField) {
        if let inputText = sender.text {
            if inputText.count > 4 {
                alertError() // error message
                sender.text?.removeLast() //回上一步
            } else {
                valueTextField.text = sender.text
            }
        }
    }
    
    //異動slider
    @IBAction func SliderChange(_ sender: Any) {
        valueTextField.textColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        colorLabelChange() //變更Slider文字部分
    }
    
    //選擇RGB Slider 變更對應文字
    func colorLabelChange() {
        redValue.text = String(format: "%0.f", redSlider.value * 255)
        greenValue.text = String(format: "%0.f", greenSlider.value * 255)
        blueValue.text = String(format: "%0.f", blueSlider.value * 255)
    }
    
    //字串太長，錯誤訊息
    func alertError(){
        //本體
        let alert = UIAlertController(title: "錯誤", message: "文字部分不可超錯4個", preferredStyle: .alert)
        //按鈕
        let okAction = UIAlertAction(title: "OK", style: .default) { (okAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        //將按鈕加入本體
        alert.addAction(okAction)
        //persent出來
        present(alert,animated: true,completion: nil)
    }
    
    
    //選擇SegmentedControl //抓值
    @IBAction func changeImage(_ sender: UISegmentedControl) {
        let selectNumber = sender.selectedSegmentIndex
        change(selectNumber)
    }
    
    //變更動作
    func change(_ Number: Int) {
        //換圖片
        appleImageView.image = UIImage(named: appleImage[Number])
        //控制文字位置
        valueTextField.frame = CGRect(x: appleLabelX[Number], y: appleLabelY[Number], width: 136, height: 50)
    }
}
