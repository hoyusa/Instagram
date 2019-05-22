//
//  ComentViewController.swift
//  Instagram
//
//  Created by 許 裕士 on 2019/05/14.
//  Copyright © 2019 許 裕士. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class ComentViewController: UIViewController {
    
    var comentData: PostData!

    @IBOutlet weak var textField: UITextField!
    
    //コメント投稿が押された時に呼ばれるメソッド
    @IBAction func handleComentButton(_ sender: Any) {
        
        // 辞書を作成してFirebaseに保存する
        let comentRef = Database.database().reference().child(Const.PostPath).child(comentData.id!)
        let comentDic = ["name": Auth.auth().currentUser!.displayName!, "coments": textField.text!]
        print(comentRef)
        print(comentDic)
       // print("😀😀😀DEBUG: \(name!)が投稿したよ😀😀😀")
        
        comentData.coments.append(comentDic)
        comentRef.updateChildValues(["coments":comentData.coments])
        
        //HUDでコメント投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメント投稿しました")
        
        //全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    //キャンセルが押された時に呼ばれるメソッド
    @IBAction func handleCancelButton(_ sender: Any) {
        //画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
