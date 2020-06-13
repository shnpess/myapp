# 猫の里親募集アプリ Hello Cat!

## Overview

猫の里親募集アプリです。

"全ての猫が幸せになって欲しい"

そんな想いから生まれたHello Cat!は誕生しました。

![FireShot Capture 021 - Hello Cat! - hellocat jp](https://user-images.githubusercontent.com/64569250/84568655-e888f200-adbb-11ea-8cff-875dc0990a36.png)

![FireShot Capture 018 - Hello Cat! - hellocat jp](https://user-images.githubusercontent.com/64569250/84568558-30f3e000-adbb-11ea-88da-9397b8601cb8.png)

![FireShot Capture 020 - Hello Cat! - hellocat jp](https://user-images.githubusercontent.com/64569250/84568637-b8415380-adbb-11ea-8ac3-4b9fc1fb25bb.png)


![FireShot Capture 019 - Hello Cat! - hellocat jp](https://user-images.githubusercontent.com/64569250/84568603-7f08e380-adbb-11ea-84ef-fc7b97afd095.png)

## 使用技術

### 技術のこだわりポイント

1. インフラにAWSを使用

2. DevOps周りの効率化（効率化が大好き）

- 理由: 未完成の段階でデプロイして効率の良い「開発→CI/CD」のフローを体験したかったため。

- CircleCIでCI/CD パイプラインの構築。

- ローカルと本番にDocker

3. 最適な設計

- インフラ

- 開発環境のコンテナ構成

- テーブル設計

## 言語・フレームワーク・インフラ

### インフラ

#### AWSの各種サービス

- VPC + ECS ＋ ECR ＋ ALB ＋ EC2 ＋ RDS(MySQL) + S3 + Route53 + ACM + Cloud Watch + SES

本番環境でもコンテナ基盤を使用

### インフラ構成図

![hellocat-infra](https://user-images.githubusercontent.com/64569250/84569064-c0e75900-adbe-11ea-940a-88fec00184e7.png)

### バックエンド

- Ruby2.6.3

- Ruby on Rails 5.2.3

### フロントエンド

- HTML

- CSS

- JavaScript

- JQuery

### 開発環境

- Docker

## URL

https://hellocat.jp
