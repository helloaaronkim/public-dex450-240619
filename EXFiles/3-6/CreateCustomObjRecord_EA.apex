//TODO #1  Course__c 型の newCourse を宣言し、
//         Name 項目に '[104] Introduction to Programming'、
//         Course_Description__c 項目に 'Learn the basics of programming with OOP'、
//         Status__c 項目に 'Active' 、
//         Duration__c 項目に 5 をコンストラクタのパラメタとして
//         初期化します

// Course__c newCourse = new Course__c();
// newCourse.Name = '[104] Introduction to Programming';

Course__c newCourse = new Course__c(
    Name = '[104] Introduction to Programming',
    Course_Description__c = 'Learn the basics of programming with OOP',
    Status__c = 'Active',
    Duration__c = 5
);

//TODO #2  insert 文を使用して newCourse のレコードをデータベースに登録します
insert newCourse;