//--------------------------------------------------------------------------------------------
//  TASK 2:  Apex を使用して、 TASK 1 で作成した SOQL クエリを反復処理するため、
//           cList という List<Contact> 型のイテレータを持つ For ループを構築する。 
//           SOQL For ループ内で、aContact という Contact 型のイテレータを持つ 2 つ目の For ループを作成し、
//           外側の For ループのイテレータである cList を使って反復処理を行います。 
//           内側の For ループ内で、System.debug() を使用して、取得したレコード情報を出力します。
//           出力例：named aContact, that iterates over the outer loop's cList variable.  
//              "取引先責任者： Erica Neumann は次の取引先に関連付けられている： Acme Corp"
//--------------------------------------------------------------------------------------------

for ( /* TODO:  Task 1 で作成したクエリを使い、取引先責任者の SOQL クエリを反復処理する*/ ) {
    for (/* TODO: 外側の For ループのイテレータである cList を使って、反復処理する */ ) {
        //TODO: 以下の文を動的な物に変更する
        System.debug('Contact: Erica Neumann is related to the following Account: Acme Corp')
    }
}
