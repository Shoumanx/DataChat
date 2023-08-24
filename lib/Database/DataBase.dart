import 'package:sqflite/sqflite.dart';

class UserTable{
  late Database db;
  List emp = [];


  createDatebaseAndTable() async {
    db = await openDatabase(
        'u.db',
        version: 1,
        onCreate: (d, v){
          // database  int
          print('Database Created....');
          d.execute('create table company '
              '(id integer primary key,'
              ' username text,'
              'password text,'
              'fullName text,'
              'type text)');
          print('Table Created....');
        },
        onOpen: (d) async {
          print('Database Opened....');
          // emp = await showData(d);
        }
    );
  }
  insert(String user, String pass, String name, String type){
    db.transaction((txn) async{
      txn.rawInsert('insert into company (username, password, fullName, type) values ("$user", "$pass", "$name", "$type")').then((value){
        print('#$value Row inserted...');
      }).onError((error, stackTrace){
        print('JUST ERROR... $error');
      });
    });
  }
  showData(Database x) async{
    return await x.rawQuery('select * from company');
  }
  showDataById(Database x, String user, String pass) async{
    return await x.rawQuery('select username, password, fullName, id, type from company WHERE username = ? And password = ?',
      [user, pass]);
  }
  showDataByIdx(Database x, int idx) async{
    return await x.rawQuery('select username, password, fullName, type from company WHERE id = ?',
        [idx]);
  }
  UpdateUsername(String user, String pass, String full, String t, int id)async{
    int n = await db.rawUpdate(
        'UPDATE company SET username = ?, password = ?, fullName = ?, type = ? WHERE id = ?',
        [user, pass, full, t , id]
    );
    print('#Row $n Updated...');
  }
  deleteUsername(int id) async{
    int count = await db.rawDelete('DELETE FROM company WHERE id = ?', [id]);
    print('Row $count deleted....');
  }

}
