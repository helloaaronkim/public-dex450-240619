//--------------------------------------------------------------------------------------------
//TASK 2: 複数のケースを検索する

//TODO: 以下の Apex を記述する:
//       - List<Case>型の cases を宣言し、以下の内容を示す SOQLクエリの実行結果で初期化する。
//         - Case オブジェクトから ID項目を SELECT する
List<Case> cases = [SELECT ID FROM Case];

System.debug('Total number of cases: ' + cases.size());
for (Case c : cases) {
    System.debug('SINGLE CASE=' + c);
}