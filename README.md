# volare_radiotalk

TechTrainの以下ミッションに挑戦用リポジトリ  
https://techbowl.co.jp/techtrain/missions/22  
https://techbowl.co.jp/techtrain/missions/23  

## env
* flutter
  * iOS, Androidを扱えるクロスプラットフォーム開発フレームワーク
* firebase
  * authentication
    * 認証に利用
  * cloud firestore
    * NoSQLクラウドデータベース
  * cloud storage
    * 各種ファイルを保存

## versions

flutter: 1.22.2

## architecture
DDDとMVVMのいいとこどり
* lib/model/repository
  * データの管理を記載
* lib/model/notifier
  * グローバルで使うステートを管理
  * データを扱うロジックを記載
* lib/presentation/pages
  * MVVMを意識
  * <page_name>_page.dart(View)と<page_name>_page_notifier.dart(ViewModel)に分ける
* lib/di_container.dart
  * DIファイル
 
