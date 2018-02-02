//
//  YJProgressHUD.swift
//  YJProgressHUD
//
//  Created by Joting You on 2018/1/31.
//  Copyright © 2018年 JotingYou. All rights reserved.
//

import UIKit
class YJProgressHUD: MBProgressHUD {
    let view = UIApplication.shared.keyWindow!
    //MARK:Show
    public func showSuccess(message:String){
        //let view = UIApplication.shared.keyWindow!
        showSuccess(message: message, toView: view)
    }
    public func showError(message:String){
        //let view = UIApplication.shared.keyWindow!
        showError(message: message, toView: view)
    }
    public func showWarning(message:String){
        //let view = UIApplication.shared.keyWindow!
        showWarning(message: message, toView: view)
    }
    public func showLoading(message:String){
        // 快速显示一个提示信息
        let hud = MBProgressHUD.init(view: view);
        hud.show(animated: true)
        
        //hud.backgroundView.style = .blur
        //hud.bezelView.color = .black
        hud.bezelView.style = .blur
        
        hud.label.text = message;

        // 再设置模式
        hud.mode = .indeterminate
        
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true;
        //hud.label.textColor = .white
        // 3秒之后再消失
        hud.hide(animated: true, afterDelay: 3)
        
        view.addSubview(hud)
    }
    //MARK:Show to view
    func showSuccess(message:String,toView:UIView){
        show(text: message, icon: "success.png", toView: toView)
    }
    func showError(message:String,toView:UIView){
        show(text: message, icon: "error.png", toView: toView)
    }
    func showWarning(message:String,toView:UIView){
        show(text: message, icon: "warning.png", toView: toView)
    }
    //MARK:ruturn hud
    func showMessage(message:String,toView:UIView) -> MBProgressHUD{
        // 快速显示一个提示信息
        let hud = MBProgressHUD.init(view: toView);
        hud.show(animated: true)
        hud.label.text = message;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true

        //hud.backgroundView.style = .blur
        hud.bezelView.color = .black
        
        hud.label.textColor = .white
        
        hud.bezelView.style = .blur
        toView.addSubview(hud)
        return hud;
    }
    func showMessage(message:String)->MBProgressHUD{
        //let view = UIApplication.shared.keyWindow!
        return showMessage(message: message, toView: view)
    }
    
    //MARK:show and hide
    
    func showHUD(){
        //let view = UIApplication.shared.keyWindow!
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    func hideHUD(forView:UIView){
        MBProgressHUD.hide(for: forView, animated: true)
    }
    func hideHUD(){
        //let view = UIApplication.shared.keyWindow!
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    //MARK:private
    func show(text:String,icon:String,toView:UIView){
        
        // 快速显示一个提示信息
        let hud = MBProgressHUD.init(view: toView);
        hud.show(animated: true)
        
        //hud.backgroundView.style = .blur
        hud.bezelView.color = .black
        hud.bezelView.style = .blur
                
        hud.label.text = text;
        // 设置图片
        hud.customView = UIImageView.init(image: UIImage.init(named: "MBProgressHUD.bundle/" + icon))
        // 再设置模式
        hud.mode = .customView
        
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = true;
        hud.label.textColor = .white
        // 3秒之后再消失
        hud.hide(animated: true, afterDelay: 3)
        
        toView.addSubview(hud)
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
