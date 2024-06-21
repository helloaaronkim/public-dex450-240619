public class CourseDeliveryTriggerHandler {

    private static Set<Date> allHolidays = new Set<Date>();

    static {
        for (Holiday h : [SELECT ActivityDate FROM Holiday]) {
            allHolidays.add(h.ActivityDate);
        }
    }

    public static void preventInvalidStartDate(List<Course_Delivery__c> newCourseDeliveryList,
                                                      Map<ID, Course_Delivery__c> oldCourseDeliveryMap) {
        
        for (Course_Delivery__c cd : newCourseDeliveryList) {
            if (oldCourseDeliveryMap?.get(cd.Id).Start_Date__c != cd.Start_Date__c) {   
                if ( allHolidays.contains(cd.Start_Date__c) ) {
                    cd.Start_Date__c.addError('aaaaaaaaaa');
                    
                    // TODO #1
                    // エラーの詳細を添えてプラットフォームイベントを即時公開する
                    Error_Message__e event = new Error_Message__e();
                    event.Source_Component__c = 'CourseDeliveryTriggerHandler';
                    event.Error_Message__c = 'エラーだよー！';
                    EventBus.publish(event);
                }
            }
        }
    }
}