//  TASK 1: 絞り込み条件を指定するためにバインド変数を使用している、
//          以下の Apex コードを実行してください。
//          この実行により、エラーが発生することが確認できます。
//--------------------------------------------------------------------------------------------
Integer numDays = 10;
List<Case> cases = [SELECT Id, Subject, CreatedDate
                    FROM Case
                    WHERE CreatedDate = LAST_N_DAYS:numDays];
System.debug(cases);
