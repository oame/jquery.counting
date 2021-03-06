# jquery.counting

jquery.counting はシンプルなカウントダウンタイマーです。

## 必要なもの

* jQuery 1.7.2+

## 特徴

* つかいやすい
* HTMLが良い感じになる

# Get Started
まずは簡単なコードを書いて jquery.counting の基本を学びましょう。

## 基本的な使い方

&lt;head&gt;タグ内に以下のHTMLタグとJavascriptのコードを挿入します。

```html
<script type="text/javascript" src="/path/to/jquery.js"></script>
<script type="text/javascript" src="/path/to/jquery.counting-1.0.js"></script>
<script type="text/javascript">
$(function(){
  $(".countdown").counting();
});
</script>
```

次に、カウントダウンを設置したい場所に以下のように書きます。  
ポイントは、jQueryセレクタで指定したクラスを持っていることと、タグの中身で期日を設定しているところです。

```html
締め切りまであと...<span class="countdown">2013/01/14</span>
```

これで一番シンプルなセットアップが完了しました！  
ページを読み込むときっと以下のように表示されるでしょう。

```html
<!-- 期日前 -->
締め切りまであと...4日と11時間22分12秒

<!-- 期日を過ぎた後 -->
締め切りまであと...期日になりました。
```

おめでとうございます。たったこれだけでカウントダウンが出来ました！  
他のサンプルは`example/`に入っています。良かったら見てみてください！

## 応用編

### 一括で設定を適用させる
`$(element).counting()`の引数で指定出来るオプションは以下の通りです。
オプションが設定されなかった場合は自動的にデフォルト値が使用されます。

オプション|デフォルト値|説明
--------|----------|-----
format  |%d日と%H時間%m分%s秒|括弧の中身がそれぞれの値に置き換えられます。
countUntil|期日までの残り時間（ミリ秒）|後からカウントアップを制御したい場合はこのオプションを変更します。
outdated_message|期日になりました。|カウントダウン用のタグの中身が空の場合に指定されます。

#### formatで使用出来るリテラル

リテラル|置換対象
-------|------
%d     |日
%H     |時間
%m     |分
%s     |秒
%M     |ミリ秒

### HTMLタグ側で個別にカスタマイズする
複数のカウントダウンがページに含まれており、その中の一つだけ、期日が過ぎた時のメッセージを変えたい場合もありましょう。そういう時はdata属性をHTMLタグに追加することで個別に設定を適用させることが出来ます。

例えば、期日を過ぎた後に表示させたいメッセージはデフォルトでは「期日になりました。」ですが、これを変更したい場合は`data-outdated`属性で指定してあげます。

```html
締め切りまであと…<span class="countdown" data-outdated="締め切りは過ぎました！">2013/01/14</span>
```

こうすることで、期日を過ぎた後に表示されるメッセージが変更されます

```html
締め切りまであと...締め切りは過ぎました！
```
	
以下に全ての使用可能なオプションを挙げておきます。

オプション        |デフォルト値|説明
----------------|----------|----------------
data-outdated   |期日になりました。|期日を過ぎた後に表示されるメッセージ
data-format     |%d日と%H時間%m分%s秒|カウントダウンのフォーマット

## イベントハンドラ
期日を迎えたら何らかのアクションを実行したいという場合のために、以下のようなイベントハンドラを用意しました。

### onOutdated

期日を迎えた際に呼び出されます。

```javascript
$(".countdown").counting({
  onOutdated: function(event){
    location.href = "/happy_birthday.html";
  }
});
```

### onCount

カウントが秒単位で変化した際に呼ばれます。カウントダウンと連動したカスタムアニメーションを定義したい場合に使うと良いでしょう。

```javascript
$(".countdown").counting({
  onCount: function(event){
    // ここに良い感じのコードを書く
  }
});
```

# 協力

プルリクエストを歓迎します！

# クレジット

Maintained by o_ame - <http://oameya.com>
Licensed under MIT License