//
//  ViewController.swift
//  AlbumPickerUse
//
//  Created by 503-26 on 21/11/2018.
//  Copyright © 2018 TheJoeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBAction func pick(_ sender: Any) {
        //앨범 출력
        let imagePicker = UIImagePickerController()
            //속성
            imagePicker.allowsEditing=false //편집 가능하게 함 -- false로 설정하면 extension에서 구현한 사진을 선택했을 때 메소드에서 editedImage가 아니라 originalImage로 가져와야 한다.
            //종류 : 미리 촬영한 이미지 가져오기
            imagePicker.sourceType = .photoLibrary //미리 촬영한 이미지 가져오기 | camera는 실제 폰에서만 가능
            //delegate 메소드 위치 설정
            imagePicker.delegate = self
        //출력
        self.present(imagePicker, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //취소를 눌렀을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //현재 창을 닫고
        self.dismiss(animated: false){
            () in
            let alert = UIAlertController.init(title: "선택 취소", message: "사진 선택을 취소하셨습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "확인", style: .cancel){
                (alert) in
                })
            self.present(alert,animated: true)
        }
}
    //사진을 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true){
            () in
            //선택한 이미지를 가져와서 imgView에 출력
            let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.imgView.image = img
        }
    }
}
