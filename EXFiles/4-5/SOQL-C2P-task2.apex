//--------------------------------------------------------------------------------------------
//  TASK 2:  Apex を使用して、 TASK 1 で作成した SOQL クエリを反復処理するため、
//           cList という List<Contact> 型のイテレータを持つ For ループを構築する。 
//           SOQL For ループ内で、aContact という Contact 型のイテレータを持つ 2 つ目の For ループを作成し、
//           外側の For ループのイテレータである cList を使って反復処理を行います。 
//           内側の For ループ内で、System.debug() を使用して、取得したレコード情報を出力します。
//           出力例：named aContact, that iterates over the outer loop's cList variable.  
//              "取引先責任者： Erica Neumann は次の取引先に関連付けられている： Acme Corp"
//--------------------------------------------------------------------------------------------

// SELECT Name, Account.Name FROM Contact

List<Contact> result = [SELECT Name, Account.Name FROM Contact];
for (Integer i = 0; i < result.size(); i++) {
    System.debug('INDEX=' + i);
    // insert, update ... 0 of 150
}

for (List<Contact> contacts : [SELECT Name, Account.Name FROM Contact]) {
    System.debug('SIZE=' + contacts.size());
    for (Contact c : contacts) {
        // System.debug('CONTACT=' + c);
    }
}

// insert, update

SELECT Name, Account.Name FROM Contact