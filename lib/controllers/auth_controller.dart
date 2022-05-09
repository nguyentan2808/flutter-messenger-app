// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:lab6/api/index.dart';

// import '../models/user_model.dart';

// class AuthController extends GetxController {
//   final user = UserModel("", "", "", "", "", "", "", "").obs;
//   final api = API();

//   UserModel get getUser => user.value;

//   // void login() {
//   //   user.value = UserModel.fromMock(
//   //     id: '1',
//   //     username: 'nguyentan2808',
//   //     name: 'Nguyen Tan',
//   //     email: "nguyentan@gmail.com",
//   //     phone: "+84 333 57 1990",
//   //     avatar:
//   //         "https://cdn.pixabay.com/photo/2015/04/23/17/41/javascript-736400_1280.png",
//   //     coverPhoto:
//   //         "https://scontent.fsgn5-13.fna.fbcdn.net/v/t1.6435-9/36759643_482364152211570_7218927000428216320_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lnodGWHtEqQAX-xiaUF&tn=UBfSfkmlnzFuV857&_nc_ht=scontent.fsgn5-13.fna&oh=00_AT8rH_QQlt6YGKOW-NcGVodDKUsO1o6z8jgs_KZWA9waaw&oe=62984B60",
//   //     status: "I'm a programmer",
//   //   );
//   // }

//   Future loginBE(String idToken) async {
//     var response = await api.login(idToken);

//     var _user = UserModel.fromJson(response.data['user']);
//     user.value = _user;

//     GetStorage().write("user", _user.toJson());

//     return null;
//   }
// }
