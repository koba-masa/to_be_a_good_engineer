# Public Access Control
## ACL(Access Control List)



## パブリックアクセスのブロック
### 新しいアクセスコントロールリスト (ACL) を介して付与されたバケットとオブジェクトへのパブリックアクセスをブロックする
- `BlockPublicAcls`
> S3 は、新しく追加されたバケットまたはオブジェクトに適用されたパブリックアクセス許可をブロックし、既存のバケットおよびオブジェクトに対する新しいパブリックアクセス ACL が作成されないようにします。この設定では、ACL を使用して S3 リソースへのパブリックアクセスを許可する既存のアクセス許可は変更されません。

### 任意のアクセスコントロールリスト (ACL) を介して付与されたバケットとオブジェクトへのパブリックアクセスをブロックする
- `IgnorePublicAcls`
> S3 はバケットとオブジェクトへのパブリックアクセスを付与するすべての ACL を無視します。

### 新しいパブリックバケットポリシーまたはアクセスポイントポリシーを介して付与されたバケットとオブジェクトへのパブリックアクセスをブロックする
- `BlockPublicPolicy`
> S3 は、バケットとオブジェクトへのパブリックアクセスを許可する新しいバケットポリシーおよびアクセスポイントポリシーをブロックします。この設定は、S3 リソースへのパブリックアクセスを許可する既存のポリシーを変更しません。

### 任意のパブリックバケットポリシーまたはアクセスポイントポリシーを介したバケットとオブジェクトへのパブリックアクセスとクロスアカウントアクセスをブロックする
- `RestrictPublicBuckets`
> S3 は、バケットとオブジェクトへのパブリックアクセスを付与するポリシーを使用したバケットまたはアクセスポイントへのパブリックアクセスとクロスアカウントアクセスを無視します。


## 参考
- [ACL によるアクセス管理](https://docs.aws.amazon.com/ja_jp/AmazonS3/latest/userguide/acls.html)
- [`AWS::S3::Bucket PublicAccessBlockConfiguration`](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-publicaccessblockconfiguration.html)

https://s3.ap-northeast-1.amazonaws.com/koba-masa.mybucket/README.md
