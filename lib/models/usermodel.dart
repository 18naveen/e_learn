
import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String username ;
  final String phone_no ;
  final String uid ;
  final String email ;
  final List interest ;
  final Map bookmark ;
  final Map history ;
  final Map progress;

const User({required this.progress, required this.uid, required this.username, required this.phone_no, required this.email, required this.interest, required this.bookmark, required this.history});

static User fromSnap(DocumentSnapshot  snap){
  var snapshot = snap.data() as Map<String, dynamic>;

  return User(
    username: snapshot["username"],
    uid: snapshot["uid"],
    phone_no: snapshot["phone_no"],
    email: snapshot["email"],
    interest: snapshot["interest"],
    bookmark: snapshot["bookmark"],
    history: snapshot["history"],
    progress: snapshot["progress"],
  );
}


  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "phone_no": phone_no,
    "interest": interest,
    "bookmark": bookmark,
    "history": history,
    "progress": progress,
  };

   User Updatebookmark(Map value){
    return User(progress: progress,
        uid: uid,
        username: username,
        phone_no: phone_no,
        email: email,
        interest: interest,
        bookmark: value,
        history: history);
  }

}



