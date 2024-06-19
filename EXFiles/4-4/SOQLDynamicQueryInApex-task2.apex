//  TASK 2: String を使用して動的に作成されたクエリを実行するために Database.query() を使用して、
//          TASK1 で発生した問題を回避する。
//--------------------------------------------------------------------------------------------

//  WHERE 句の指定
//      構築する WHERE 句は、Case sObject の CreatedDate 項目が過去 N 日以内か判定する必要があります。
//      N の値は、ハードコーディングされている変数 numDays により決定しています
//      これを実行するためには、whereClause 変数に以下の要件を満たす値を代入します。
//      　- Where 句で、CreatedDate 項目の値が LAST_N_DAYS の日付リテラルの値と等しいかチェックする記述
//        - 変数 numDays をバインド変数で含める

Integer numDays = 10;
String selectClause = 'SELECT Id, Subject, CreatedDate ';
String fromClause = 'FROM Case ';

//TODO: 要件に従って、whereClause 変数を埋める
String whereClause = 'PLEASE_FILL_ME_IN';  

String fullQuery = selectClause + fromClause + whereClause;
List<Case> caselist = Database.query(fullQuery);

System.debug('\n\nTotal number of cases: ' + caseList.size());
for (Case c : caseList) {
    System.debug(c);
}
