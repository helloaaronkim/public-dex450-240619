public class ContactsDML {
    public static void standaloneDML(){
        //----------------------------------------------------------
        // TASK 1: スタンドアロン DML コマンドを使用し、新規取引先責任者レコードを追加します
        //----------------------------------------------------------

        // TODO #1: Contact 型の変数 name1 を宣言し、
        //          LastName を 'Minkowitz' としてインスタンス化します
        Contact name1 = new Contact();
        name1.LastName = 'Minkowitz';

        // TODO #2: Contact 型の変数 name2 を宣言し、
        //          LastName を 'Singh' としてインスタンス化します
        Contact name2 = new Contact();
        name2.LastName = 'Singh';

        // TODO #3: List<Contact> 型の変数 contacts を宣言し、インスタンス化します
        List<Contact> contacts = new List<Contact>();

        // TODO #4: name1 をリストに追加します
        contacts.add(name1);

        // TODO #5: name2 をリストに追加します
        contacts.add(name2);

        // TODO #6: スタンドアロン DML を使用し、contacts をデータベースに Insert します
        insert contacts;

        // 正常に登録できた場合は、挿入された Id 項目が変数にセットされます
        // TODO #7: name1 の Id を デバッグログに出力します
        System.debug('NAME1=' + name1.Id);

        // TODO #8: name2 の Id を デバッグログに出力します
        System.debug('NAME2=' + name2.Id);

    }

    public static void databaseMethodDML(){
        //-------------------------------------------------------------
        // TASK 2: Database クラスのメソッドを使用し、取引先責任者レコードを追加します
        //-------------------------------------------------------------

        // TODO #1: Contact 型の変数 name1 を宣言し、項目値はセットせずインスタンス化します

        // TODO #2: Contact 型の変数 name2 を宣言し、
        //          LastName を 'Picasso' としてインスタンス化します

        // TODO #3: List<Contact> 型の変数 contacts を宣言し、インスタンス化します

        // TODO #4: name1 と name2 をリストに追加します


        // TODO #5: Database.insert メソッドを使用し、
        //          スタンドアロン DML である insert contacts と同様の挙動を実行させます
        //          name1 は、必須項目がセットされていないため DML Exceptionが発生します

    }

    public static void databaseMethodPartialCommit(){
        //-----------------------------------------------------------------------------
        // TASK 3: Database クラスのメソッドを使用し、取引先責任者レコードを追加します
        //         このメソッドでは、パラレルコミットで処理を行います
        //-----------------------------------------------------------------------------

        // TODO #1: Contact 型の変数 name1 を宣言し、項目値はセットせずインスタンス化します

        // TODO #2: Contact 型の変数 name2 を宣言し、
        //          LastName を 'Picasso' としてインスタンス化します

        // TODO #3: List<Contact> 型の変数 contacts を宣言し、インスタンス化します

        // TODO #4: name1 と name2 をリストに追加します


        // TODO #5: Database.insert メソッドを使用し、データを登録します
        //          パラメタを使用して、パラレルコミット可能にします

        // TODO #6: name2 の Id をデバッグログに出力します

    }

// こちら！！    
public static void exceptionsDML(){
        List<Contact> contacts = new List<Contact>();

        Contact noName = new Contact();
        contacts.add(noName);

        Contact newContact = new Contact(LastName = 'Benett');
        contacts.add(newContact);

        Contact longName = new Contact(LastName = '00085chars00085chars00085chars00085chars00085chars00085chars00085chars00085chars00085');
        contacts.add(longName);

        // 現在のリストをベースに新しいリストを宣言します - 後で使用します
        List<Contact> newListContact = new List<Contact>(contacts);

        // TODO #1: List<Database.SaveResult> 型の List を lsr として宣言し、
        //          Database.insert メソッドを使用して、登録した結果を使用し初期化します。
        //          部分コミットを可能とするパラメタを指定して、コールします。
        List<Database.SaveResult> saveResults = Database.insert(contacts, false);

        // TODO #2: Database.SaveResult 型の変数 sr を使用し、lsr の For ループを構成します
        for (Database.SaveResult saveResult : saveResults) {

            // TODO #3: ループ内で、if 文を使用し、Database.SaveResult クラスの
            //          isSuccess() メソッドを呼び出して、insertが失敗した場合のみ
            //          処理されるブロックを構成します
            if (!saveResult.isSuccess()) { // 成功ではなかったらー
                // TODO #4: If 文内で sr.getErrors() の結果を受け取る、
                //          Database.Error 型の変数 err を使用した For ループを構成します
                List<Database.Error> errors = saveResult.getErrors();
                for (Database.Error error : errors) {
                    // TODO #5: err 変数から getStatusCode メソッドと getMessage メソッドを呼出し、
                    //          その内容を保存するための Error_log__c オブジェクトのレコードを生成する。
                    Error_Log__c errorLog = new Error_Log__c();
                    errorLog.Source__c = 'exceptionsDML';
                    errorLog.Message__c = error.getStatusCode() + ' : ' + error.getMessage();
                    insert errorLog;
                }
            }
        }

        newListContact[1] = null;
        try {
            List<Database.SaveResult> lsr2 = Database.insert(newListContact, false);
        } catch(ListException e) {
            Error_Log__c error_null = new Error_Log__c();
            error_null.Source__c = 'exceptionsDML';
            error_null.Message__c = e.getMessage();
            insert error_null;
        }
    }
}
