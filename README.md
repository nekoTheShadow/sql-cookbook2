# このレポジトリについて

- 『SQLクックブック 第2版: データベースエキスパート、データサイエンティストのための実践レシピ集』の自分の回答集です
    - https://www.oreilly.co.jp/books/9784873119779/
    - https://honto.jp/netstore/pd-book_31431103.html
- とくに指定のない場合、PostgreSQLを利用しています。その他のDBMSを利用する場合は、SQLファイル内に指定があります

# DBMSの起動方法

- DBMSの起動にはDockerを利用する。
    - 参考: https://qiita.com/neko_the_shadow/items/c12d5968bf9c5b2b6d1e
- テーブルの初期化については`INIT`ディレクトリにあるSQLファイルを利用する

## PostgreSQL

```
docker run --rm -d \
  -p 5432:5432 \
  -e POSTGRES_USER=testuser \
  -e POSTGRES_PASSWORD=passw0rd \
  -e POSTGRES_DB=testdb \
  postgres:14
```

## Db2

- クライアントソフトからDb2に接続するのは設定が複雑で面倒なため、CLIから操作する。
- Db2のDockerイメージは起動が重たいので、作成したコンテナを使いまわすとよい

```
docker run -d \
  --privileged=true \
  -p 50000:50000 \
  -e LICENSE=accept \
  -e DB2INST1_PASSWORD=passw0rd \
  -e DBNAME=testdb \
  ibmcom/db2:11.5.7.0

docker exec -it <containerid> su - db2inst1
db2 -tv
connect to testdb user db2inst1 using passw0rd;
```

## SQLServer

```
docker run --rm -d \
  -p 1433:1433 \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=1234@Hoge \
  mcr.microsoft.com/mssql/server:2019-latest
```

## Oracle

- 以下の手順にしたがって環境が構築済みであることが前提。
    - https://github.com/oracle/docker-images/blob/main/OracleDatabase/SingleInstance/README.md
- OracleのDockerイメージは起動が重たいので、作成したコンテナを使いまわすとよい

```
docker run -d \
  -p 1521:1521 \
  -p 5500:5500 \
  -e ORACLE_PWD=passw0rd \
  -e ORACLE_PDB=testdb \
  oracle/database:19.3.0-se2
```

# 目次

- レシピ1.1 テーブルからすべての行と列を取得する
- レシピ1.2 テーブルから行の一部を取得する
- レシピ1.3 複数の条件を満たす行を取得する
- レシピ1.4 テーブルから列の一部を取得する
- レシピ1.5 列に意味のある名前を付ける
- レシピ1.6 WHERE句の中でエイリアス化された列を参照する
- レシピ1.7 列値を連結する
- レシピ1.8 SELECT文で条件ロジックを使う
- レシピ1.9 返す行数を制限する
- レシピ1.10 テーブルからn個のランダムなレコードを返す
- レシピ1.11 NULLを探す
- レシピ1.12 NULLを実際の値に変換する
- レシピ1.13 パターンを検索する
- レシピ2.1 クエリ結果を指定の順序で返す
- レシピ2.2 複数のフィールドでソートする
- レシピ2.3 部分文字列でソートする
- レシピ2.4 英数字の混合データをソートする
- レシピ2.5 ソート時にNULLを扱う
- レシピ2.6 データ依存のキーに対してソートする
- レシピ3.1 ある行セットを別の行セットの上にスタックする
- レシピ3.2 関連する行を組み合わせる
- レシピ3.3 2つのテーブルに共通する行を取得する
- レシピ3.4 テーブルAからテーブルBには存在しない値を取得する
- レシピ3.5 テーブルAからテーブルB内に対応する行がない行を取得する
- レシピ3.6 他の結合を妨げずにクエリに結合を追加する
- レシピ3.7 2つのテーブルが同じデータを持つかどうかを判断する
- レシピ3.8 直積を特定して回避する
- レシピ3.9 集約の使用時に結合を実行する
- レシピ3.10 集約の使用時に外部結合を実行する
- レシピ3.11 複数テーブルから欠損データを返す
- レシピ3.12 演算や比較でNULLを使う
- レシピ4.1 新しいレコードを挿入する
- レシピ4.2 デフォルト値を挿入する
- レシピ4.3 デフォルト値をNULLにオーバーライドする
- レシピ4.4 別のテーブルに行をコピーする
- レシピ4.5 テーブル定義をコピーする
- レシピ4.6 一度に複数のテーブルに挿入する
- レシピ4.7 特定の列への挿入をブロックする
- レシピ4.8 テーブル内のレコードを変更する
- レシピ4.9 対応する行が存在する場合に更新する
- レシピ4.10 別のテーブルの値で更新する
- レシピ4.11 レコードをマージする
- レシピ4.12 テーブルからすべてのレコードを削除する
- レシピ4.13 特定のレコードを削除する
- レシピ4.14 1つのレコードを削除する
- レシピ4.15 参照整合性違反を削除する
- レシピ4.16 重複レコードを削除する
- レシピ4.17 他のテーブルから参照されているレコードを削除する
- レシピ5.1 スキーマ内のテーブルの一覧を表示する
- レシピ5.2 テーブルの列の一覧を表示する
- レシピ5.3 テーブルのインデックス付けされた列の一覧を表示する
- レシピ5.4 テーブルに対する制約の一覧を表示する
- レシピ5.5 対応するインデックスがない外部キーを一覧表示する
- レシピ5.6 SQLを使ってSQLを生成する
- レシピ5.7 Oracleでデータディクショナリビューを表示する
- レシピ6.1 文字列を反復処理する
- レシピ6.2 文字列リテラル内にクォートを埋め込む
- レシピ6.3 文字列内の文字の出現回数をカウントする
- レシピ6.4 文字列から不要な文字を取り除く
- レシピ6.5 数値データと文字データを分離する
- レシピ6.6 文字列が英数字かどうかを判別する
- レシピ6.7 名前からイニシャルを抽出する
- レシピ6.8 文字列の一部でソートする
- レシピ6.9 文字列内の数字でソートする
- レシピ6.10 テーブル行から区切りリストを作成する
- レシピ6.11 区切りデータから複数値を持つINリストへ変換する
- レシピ6.12 文字列をアルファベット順にする
- レシピ6.13 数値として扱える文字列を特定する
- レシピ6.14 n番目の区切り部分文字列を抽出する
- レシピ6.15 IPアドレスをパースする
- レシピ6.16 発音で文字列を比較する
- レシピ6.17 パターンにマッチしないテキストを探す
- レシピ7.1 平均値を計算する
- レシピ7.2 列の最大値と最小値を探す
- レシピ7.3 列の値を合計する
- レシピ7.4 テーブルの行数をカウントする
- レシピ7.5 列の値の数をカウントする
- レシピ7.6 累積和を求める
- レシピ7.7 累積積を求める
- レシピ7.8 値を平滑化する
- レシピ7.9 最頻値を計算する
- レシピ7.10 中央値を計算する
- レシピ7.11 総計に対する割合を求める
- レシピ7.12 NULLを許容する列を集約する
- レシピ7.13 最高値と最低値を除いた平均値を計算する
- レシピ7.14 英数字文字列を数字に変換する
- レシピ7.15 累積和の値を変更する
- レシピ7.16 中央絶対偏差を使って外れ値を探す
- レシピ7.17 ベンフォードの法則を使って異常を特定する
- レシピ8.1 日、月、年の加算や減算を行う
- レシピ8.2 2つの日付間の日数を求める
- レシピ8.3 2つの日付間の平日の日数を求める
- レシピ8.4 2つの日付間の月数や年数を求める
- レシピ8.5 2つの日付間の秒数、分数、時間数を求める
- レシピ8.6 1年間の各曜日の出現回数をカウントする
- レシピ8.7 現在のレコードと次のレコードの日付の差を求める
- レシピ9.1 ある年がうるう年かどうかを判定する
- レシピ9.2 1年の日数を計算する
- レシピ9.3 日付から単位時間を抽出する
- レシピ9.4 月の最初の日と最終日を求める
- レシピ9.5 1年の中の特定の曜日のすべての日付を求める
- レシピ9.6 ある月に特定の曜日が最初と最後に出現する日付を求める
- レシピ9.7 カレンダーを作成する
- レシピ9.8 年の四半期の開始日と終了日を表示する
- レシピ9.9 指定された四半期の開始日と終了日を求める
- レシピ9.10 欠損日付を埋める
- レシピ9.11 特定の単位時間を探す
- レシピ9.12 日付の特定の部分を使ってレコードを比較する
- レシピ9.13 重複する日付範囲を特定する
- レシピ10.1 連続した値の範囲を特定する
- レシピ10.2 同じグループやパーティション内の行間の差を求める
- レシピ10.3 連続する値の範囲の最初と最後を求める
- レシピ10.4 値の範囲内の欠損値を埋める
- レシピ10.5 連続する数値を生成する
- レシピ11.1 結果セットをページネーションする
- レシピ11.2 テーブルからn行をスキップする
- レシピ11.3 外部結合の使用時に論理和ロジックを組み込む
- レシピ11.4 逆関係の行を判別する
- レシピ11.5 上位n個のレコードを取得する
- レシピ11.6 最高値と最低値を持つレコードを探す
- レシピ11.7 先の行を調べる
- レシピ11.8 行の値をシフトする
- レシピ11.9 結果をランク付けする
- レシピ11.10 重複を取り除く
- レシピ11.11 ナイト値を探す
- レシピ11.12 簡単な予測を行う
- レシピ12.1 結果セットを1行にピボットする
- レシピ12.2 結果セットを複数行にピボットする
- レシピ12.3 結果セットをアンピボットする
- レシピ12.4 結果セットを 1列にアンピボットする
- レシピ12.5 結果セットから反復値を取り除く
- レシピ12.6 結果セットをピボットして行をまたいだ計算を容易にする
- レシピ12.7 固定長のデータグループを作成する
- レシピ12.8 所定の数のグループを作成する
- レシピ12.9 水平ヒストグラムを作成する
- レシピ12.10 垂直ヒストグラムを作成する
- レシピ12.11 非GROUP BY列を返す
- レシピ12.12 簡単な小計を計算する
- レシピ12.13 考えられるすべての表現の組み合わせに対する小計を計算する
- レシピ12.14 小計ではない行を識別する
- レシピ12.15 CASE式を使って行にフラグを付ける
- レシピ12.16 疎行列を作成する
- レシピ12.17 単位時間で行をグループ化する
- レシピ12.18 次元が異なるグループやパーティションに対して同時に集約を実行する
- レシピ12.19 値の移動範囲に対して集約を実行する
- レシピ12.20 小計を含む結果セットをピボットする
- レシピ13.1 親子関係を表す
- レシピ13.2 親子孫関係を表す
- レシピ13.3 テーブルの階層的なビューを作成する
- レシピ13.4 ある親行に対するすべての子行を探す
- レシピ13.5 行がリーフノード、ブランチノード、ルートノードのいずれであるかを判別する
- レシピ14.1 SQL ServerのPIVOT演算子を使ってクロス集計レポートを作成する
- レシピ14.2 SQL ServerのUNPIVOT演算子を使ってクロス集計レポートをアンピボットする
- レシピ14.3 OracleのMODEL句を使って結果セットを転置する
- レシピ14.4 任意の場所から文字列要素を抽出する
- レシピ14.5 1年の日数を求める（Oracle用の別の解決策）
- レシピ14.6 英数字の混合文字列を探す
- レシピ14.7 Oracleを使って整数を2進数に変換する
- レシピ14.8 ランク付けされた結果セットをピボットする
- レシピ14.9 変換した2つの結果セットに列ヘッダを追加する
- レシピ14.10 Oracleでスカラサブクエリを複合サブクエリに変換する
- レシピ14.11 シリアル化されたデータを複数の行に分割する
- レシピ14.12 総計に対する割合を求める
- レシピ14.13 グループ内の値の存在を調べる