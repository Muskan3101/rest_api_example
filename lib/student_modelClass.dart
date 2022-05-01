class Student2{
  var name;
  var id;

  Student2({this.name, this.id});
  // Factory Constructor
  factory Student2.fromJson(Map<String, dynamic> map){
    return Student2(name: map["name"], id: map["id"]);
  }
}