trigger CourseDeliveryTrigger on Course_Delivery__c (before insert, before update) {
    // Load holidays

    // TODO Load custom metadata type's value
    // if switch true then ok || false then nothing.
    Trigger_Switch__mdt triggerFlg = Trigger_Switch__mdt.getInstance('CourseDeliveryTrigger');
    
    if (triggerFlg != null && triggerFlg.Active_Flag__c == true) {
        // Set<Date> holidays = new Set<Date>();
        // for (Holiday h : [SELECT Name, ActivityDate FROM Holiday]) {
        //     holidays.add(h.ActivityDate);
        // }
    
        // // TODO Trigger.new -> for -> compare with holiday -> contains -> if true, add error for stopping transaction.
        
        // for (Course_Delivery__c courseDelivery : Trigger.new) {
        //     Boolean isDataInsertedOrUpdated = (Trigger.isInsert || Trigger.oldMap.get(courseDelivery.Id).Start_Date__c
        //         != courseDelivery.Start_Date__c
        //     );
    
        //     // holidays.contains(arg0)
        //     if (isDataInsertedOrUpdated && courseDelivery.Start_Date__c != null) {
        //         // 本格的なロジックはこちら
        //         if (holidays.contains(courseDelivery.Start_Date__c)) {
        //             // courseDelivery.Start_Date__c = '1010/11/11';
        //             courseDelivery.Start_Date__c.addError('休日はダメやろ！！');
        //             courseDelivery.addError('ダメダメ');
        //         }
        //     }
        // }

        CourseDeliveryTriggerHandler.preventInvalidStartDate(Trigger.new, Trigger.oldMap);

    } else {
        System.debug('Trigger setting seems in inactive status');
    }
}