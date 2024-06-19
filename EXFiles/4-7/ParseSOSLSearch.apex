// 検索文字列の定義
String searchString = 'Frank';

// 検索データを複数オブジェクトから検索する
List<List<sObject>> searchResults = [FIND :searchString 
	RETURNING Contact(FirstName, LastName), User(FirstName, LastName)];

 /** TODO #1: List<Contact> 型の resultContacts を宣言し、
 *           searchResults の 0番目の結果を代入
 */ 


 /** TODO #2: Contact 型の resultContact を使用して、resultContacts の拡張 For ループを定義
 *           ループ内では、System.debug() を 3 回コールし、以下の情報を出力：
 *             -- resultContact の Id 項目
 *             -- resultContact の first name 項目
 *             -- resultContact の last name 項目
 */


/** TODO #3: List<User> 型の resultUsers を宣言し、
 *           searchResults の 1番目の結果を代入
 */


for(User resultUser : resultUsers){
    System.debug('The User id is: ' + resultUser.id);
    System.debug('The User first name is: ' + resultUser.firstname);
    System.debug('The User last name is: ' + resultUser.lastname + '\n');
}


// OPTIONAL TODO #4: 以下の実装コードを参照してください
//                   この処理では、Contact と User を同一のループで処理しています
/*
// 他のソリューション例
for(List<sObject> resultList :[FIND '{Frank}' 
                               RETURNING Contact(FirstName, LastName), 
                                         User(FirstName, LastName)]){
    System.debug('\n\nCurrently Processing ' + resultList[0].getSObjectType());
    for(sObject record :resultList){
        System.debug('\nThe record id is: ' + record.get('Id'));
        System.debug('The first name is: ' + record.get('FirstName'));
        System.debug('The last name is: ' + record.get('LastName'));
    }
}
*/