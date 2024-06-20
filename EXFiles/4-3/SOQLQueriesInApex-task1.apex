//--------------------------------------------------------------------------------------------
//TASK 1: 単一のケースを検索する

//TODO: 以下の Apex を記述する:
//       - Case型の aCase を宣言し、以下の内容を示す SOQLクエリの実行結果で初期化する。
//         - Case オブジェクトで Subject項目を SELECT し、
//         - Where 句では、Salesforce UI（Web）から取得したケースレコードの Id 値を使用して 1件のレコードを絞り込む

Case aCase = [SELECT Subject FROM Case WHERE ID = '500IT00002iJKycYAG'];
System.debug('SAMPLE DATA=' + aCase);

SELECT Id FROM Contact


