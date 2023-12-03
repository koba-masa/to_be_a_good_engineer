# JMeterの使い方

## 日本語化

`/usr/local/Cellar/jmeter/5.6.2/libexec/bin/jmeter#170`

```diff
# Set language
# Default to en_EN
- : "${JMETER_LANGUAGE:="-Duser.language=en -Duser.region=EN"}"
+ : "${JMETER_LANGUAGE:="-Duser.language=ja -Duser.region=JP"}"
```

## 設定

### スレッドグループ

ひとつのテストケースを構成するテストの集まり

### サンプラー

#### HTTPリクエスト

### リスナー

## 参考

- [TECHSCORE#JMeter](https://www.techscore.com/tech/Java/ApacheJakarta/JMeter/)
- [Apache JMeterの負荷シナリオ作りで苦労した話](https://techblog.booklista.co.jp/entry/2022/12/02/132111)
