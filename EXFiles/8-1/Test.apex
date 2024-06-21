DescribeSObjectResult dsr = Contact.getSObjectType().getDescribe();
System.debug('dsr.getLabel()=' + dsr.getLabel());
System.debug('dsr.isCreateable()=' + dsr.isCreateable());
// dsr.getLabel();          // 対象オブジェクトの表示ラベル名
// dsr.isCreateable();      // ユーザーに作成権限があれば true、なければ false

DescribeFieldResult dfr = Contact.FirstName.getDescribe();
System.debug('dfr.getLength()=' + dfr.getLength());
System.debug('dfr.isUpdateable()=' + dfr.isUpdateable());
// dfr.getLength();         // 項目の最大文字列
// dfr.isUpdateable();      // ユーザーに更新権限があれば true 、なければ false


Integer queryRowsRemaining = Limits.getLimitQueryRows() - Limits.getQueryRows();
Integer dmlStmtRemaining = Limits.getLimitDmlStatements() - Limits.getDmlStatements();
System.debug('REMAINING QUERY ROWS=' + queryRowsRemaining);
System.debug('DML STATEMENT REMAINING=' + dmlStmtRemaining);

List<Course_Attendee__c> courseAttendees = [SELECT ID, Name, Status__c 
                                            FROM Course_Attendee__c
                                            LIMIT :queryRowsRemaining];
if (courseAttendees.size() == queryRowsRemaining) {
    System.debug('Refine your query criteria');
} else {
    // TODO
    System.debug('[DEBUG] Start process because query limit is enough');
}