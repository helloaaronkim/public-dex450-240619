trigger ErrorMessageTrigger on Error_Message__e (after insert) {

    List<Error_Log__c> errs = new List<Error_Log__c>();
    
    // TODO #1
    // trigger.new をループして、各プラットフォームイベントに対して 
    // Error_Log__c レコードを作成し、作成したレコードは errs リストに追加する
    
    for (Error_Message__e message : Trigger.new) {
        Error_Log__c err = new Error_Log__c();
        err.Source__c = message.Source_Component__c;
        err.Message__c = message.Error_Message__c;
        errs.add(err);
    }

    insert errs;
}