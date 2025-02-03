# iOSの歩数計アプリ開発ガイド

## 概要
CoreMotionフレームワークを使用したiOS向け歩数計アプリ。歩数と移動距離を計測・表示。

## 環境構築
- Xcode最新版
- Apple Developer Program登録
- Swift & SwiftUI

## 必要な設定
1. Info.plist
```xml
<key>NSMotionUsageDescription</key>
<string>歩数をカウントするために必要です</string>
```

2. Capabilities
- Background Modes有効化
- Motion Usage有効化

## 確認手順
1. シミュレータテスト
- Features > Location > Custom Location設定
- アプリ起動で歩数カウント開始

2. 実機テスト
- デバイス接続
- Team設定確認
- ビルド実行

## GitHub連携
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin [リポジトリURL]
git push -u origin main
```