//
//  ViewController.swift
//  SingleViewApp
//
//  Created by alan king on 2019/1/8.
//  Copyright © 2019年 Allen Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var uiswitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel(frame: CGRect(x:10, y:20, width:300, height:100))
        label.text = "《Swift语言实战入门》"
        label.font = UIFont(name: "Zapfino", size: 20)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black;
        label.textAlignment = NSTextAlignment.right
        label.shadowColor = UIColor.gray;
        label.shadowOffset = CGSize(width: -5, height: 5)
        
        self.view.addSubview(label);
        
        let button = UIButton(type: .contactAdd)
        button.frame = CGRect(x: 10, y: 150, width: 100, height: 30)
        button.setTitle("按钮", for: .normal)
        button.addTarget(self, action: #selector(ViewController.tapped), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        let textField = UITextField(frame: CGRect(x: 10, y: 190, width: 200, height: 30))
        // 设置边框样式为圆角矩形
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "请输入用户名"
        textField.text = "luofei614"
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        //textField.background = UIImage(cgImage: "background")
        
        self.view.addSubview(textField)
        
        let textview = UITextView(frame: CGRect(x: 10, y: 310, width: 250, height: 100))
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.gray.cgColor
        textview.isEditable = false
        textview.text = "第一行\n第二行\n第三行\n第四行\n第五行\ntel: 02412345678\n"
        textview.dataDetectorTypes = UIDataDetectorTypes.all
        self.view.addSubview(textview)
        
        uiswitch = UISwitch()
        uiswitch.center = CGPoint(x: 250, y: 205)
        uiswitch.setOn(true, animated: false)
        uiswitch.addTarget(self, action: #selector(ViewController.switchDidChange), for: .valueChanged)
        
        self.view.addSubview(uiswitch)
        
        let items = ["选项一", "选项二", "选项三"]
        let segmented = UISegmentedControl(items: items)
        segmented.center = CGPoint(x: 200, y: 165)
        segmented.selectedSegmentIndex = 1
        segmented.addTarget(self, action: #selector(ViewController.segmentDidChange(segmented:)), for: .valueChanged)
        
        self.view.addSubview(segmented)
        
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.addTarget(self, action: #selector(ViewController.sliderDidChange(slider:)), for: .valueChanged)
        
        self.view.addSubview(slider)
        
        let imageView = UIImageView(image: UIImage(named: "xcicon"))
        imageView.frame = CGRect(x: 10, y: 420, width: 100, height: 100)
        
        self.view.addSubview(imageView)
    }

    @IBAction func tapped() -> Void {
        print("tapped")
    }
    
    @IBAction func switchDidChange(){
        print(uiswitch.isOn)
    }
    
    @IBAction func segmentDidChange(segmented: UISegmentedControl){
        print(segmented.selectedSegmentIndex)
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex) ?? "N/A")
    }
    
    @IBAction func sliderDidChange(slider: UISlider){
        print(slider.value)
    }
}

