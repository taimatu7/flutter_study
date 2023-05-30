import 'package:flutter/material.dart';
import 'package:flutter_study/models/schema.dart';
import 'package:realm/realm.dart';

void main() {
  MyApp();
}

class MyApp {
  MyApp() {
    // realmの初期化
    List<SchemaObject> shemaObjects = [Member.schema, Department.schema];
    final config = Configuration.local(shemaObjects);
    final realm = Realm(config);

    // データの追加
    final department = Department(ObjectId(), 'develop');
    final member = Member(ObjectId(), 'hoge tarou', 'a@a.com');
    department.members.add(member);
    realm.write(() => realm.add(department));

    // データの取得
    var departments = realm.all<Department>();
    var members = realm.all<Member>();
    print('Departmentテーブルから取得：${departments[0].name}');
    print('Memberテーブルから取得：${members[0].name}');

    // adbもしくはandroid studioでデータファイルを確認する
  }
}
