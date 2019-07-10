//
//  RunLogVC.swift
//  Sleep
//
//  Created by Haitao on 16/4/6.
//  Copyright © Haitao. All rights reserved.
//

import UIKit

class RunLogVC: UIViewController {

    @IBOutlet weak var logTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "日志"

        self.logTV.text = HTLogTool.readLogInfo()

    }

    @IBAction func cleanLog(_ sender: AnyObject) {
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("取消", comment: ""), style: UIAlertAction.Style.cancel) { (action: UIAlertAction!) -> Void in};
        let sureAction = UIAlertAction(title: NSLocalizedString("确定", comment: ""), style: UIAlertAction.Style.default) { (action: UIAlertAction!) -> Void in
            HTLogTool.clearLogInfo();
            self.logTV.text = "";
        }
        let alert = UIAlertController(title: NSLocalizedString("提示", comment: ""), message: NSLocalizedString("删除日志", comment: ""), preferredStyle: UIAlertController.Style.alert);
        alert.addAction(cancelAction);
        alert.addAction(sureAction);
        present(alert, animated: true, completion: nil);

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
