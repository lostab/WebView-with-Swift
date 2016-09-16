//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by 王威 on 2016/09/15.
//  Copyright © 2016年 Hulu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webView = UIWebView();
        webView.frame = self.view.frame;
        self.view.addSubview(webView);
        let openurl = URL(fileURLWithPath:Bundle.main.path(forResource: "tg", ofType:"html")!);
        //let openurl = URL(string: "http://hulu.im/")!;
        let request = URLRequest(url: openurl);
        webView.loadRequest(request);
        webView.delegate = self;
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        // shouldStart
        if (request.url?.absoluteString.contains("http") == true) {
            if (UIApplication.shared.canOpenURL(request.url!)) {
                UIApplication.shared.open(request.url!, options:[:], completionHandler:nil);
                return false;
            }
            return true;
        } else {
            return true;
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

