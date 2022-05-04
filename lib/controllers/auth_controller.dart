import 'package:get/get.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  final user = (null as UserModel).obs;

  UserModel get getUser => user.value;

  void login() {
    user.value = UserModel.fromMock(
      id: '1',
      username: 'nguyentan2808',
      name: 'Nguyen Tan',
      email: "nguyentan@gmail.com",
      phone: "+84 333 57 1990",
      avatar:
          "https://scontent.fsgn5-13.fna.fbcdn.net/v/t1.6435-9/36759643_482364152211570_7218927000428216320_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lnodGWHtEqQAX-xiaUF&tn=UBfSfkmlnzFuV857&_nc_ht=scontent.fsgn5-13.fna&oh=00_AT8rH_QQlt6YGKOW-NcGVodDKUsO1o6z8jgs_KZWA9waaw&oe=62984B60",
      coverPhoto:
          "https://scontent.fsgn5-13.fna.fbcdn.net/v/t1.6435-9/36759643_482364152211570_7218927000428216320_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lnodGWHtEqQAX-xiaUF&tn=UBfSfkmlnzFuV857&_nc_ht=scontent.fsgn5-13.fna&oh=00_AT8rH_QQlt6YGKOW-NcGVodDKUsO1o6z8jgs_KZWA9waaw&oe=62984B60",
      status: "I'm a programmer",
    );

    print(user.value.name);
  }
}
