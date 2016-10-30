//
//  ViewController.swift
//  FirstSwift
//
//  Created by 芦彬 on 15/11/30.
//  Copyright © 2015年 Lubin. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    var myTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.myTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        self.myTableView?.backgroundColor = UIColor.orange
        self.myTableView?.delegate = self
        self.myTableView?.dataSource = self
        self.view .addSubview(self.myTableView!)
        self.myTableView?.register(UITableViewCell.self, forCellReuseIdentifier:"cellIndentify")
        
        var myButton : UIButton?
        myButton = UIButton.init(type: UIButtonType.custom)
        myButton?.backgroundColor = UIColor.red
        myButton?.setTitle("按钮", for: UIControlState())
        myButton?.layer.masksToBounds = true
        myButton?.layer.cornerRadius = 5
        myButton?.frame = CGRect(x: 375 / 2 - 50, y: 667 - 100, width: 100, height: 50)
        myButton?.addTarget(self, action: "buttonAction", for: UIControlEvents.touchDragInside)
        self.view .addSubview(myButton!)
        func buttonAction(){
            print(1)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellIndentify")!
        cell.textLabel?.text = "1"
        cell.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.1)
        //        let afn = AFHTTPSessionManager
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

