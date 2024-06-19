//(OPTIONAL) TASK 3: 特定のレコードタイプで作成されたレコードを検索する
//--------------------------------------------------------------------------------------------

//  WHERE 句の指定
//      構築する WHERE 句は、Case sObject の RecordTypeId 項目が productSupportId 変数に
//      格納されている id 値と等しいかどうかを判定する必要があります。
//      これを実行するためには、whereClause 変数に以下の要件を満たす値を代入します。
//      　- Where 句で、RecordTypeId 項目の値が productSupportId 変数の値と一致するかをチェックする記述
//        - 変数 productSupportId をバインド変数で含める

//TODO: レコードタイプ Id を取得するコードを確認する。変更する必要は無し
Id productSupportId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('Product_Support').getRecordTypeId();

String selectClause = 'SELECT Id, Status, Subject ';
String fromClause = 'FROM Case ';

//TODO: 要件に従って whereClause 変数を埋める
String whereClause = 'PLEASE_FILL_ME_IN';    

String fullQuery = selectClause + fromClause + whereClause;
List<Case> cases = Database.query(fullQuery);
System.debug('Total number of cases: ' + cases.size());
for (Case c : cases) {
    System.debug(c);
}

// NOTE [SELECT Id, Status, Subject FROM Case WHERE RecordType.DeveloperName='Product_Support']
// 上記 SOQL は、レコードタイプを絞り込み条件とする有効な代替アプローチである。