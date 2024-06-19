public class CourseManager {

    /**
    *  このクラスは、コースオブジェクトのレコードを管理するメソッドを含みます
    */

    public static Set<Course__c> findDuplicates(List<Course__c> oldCourseList, List<Course__c> newCourseList) {

        Set<Course__c> courseDuplicatesSet = new Set<Course__c>();

        for (Course__c course : newCourseList) {
            // 実際存在しているか確認
            if (oldCourseList.contains(course)) {
                courseDuplicatesSet.add(course);
            }            
        }

        return courseDuplicatesSet;
    }
}
