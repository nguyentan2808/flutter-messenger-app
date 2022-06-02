import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab6/components/notification.dart';
import 'package:lab6/constants/routes_constant.dart';
import 'package:lab6/models/conversation_model.dart';
import 'package:provider/provider.dart';

import '../../api/index.dart';
import '../../constants/theme_constant.dart';
import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import 'components/people.dart';
import 'components/row_item.dart';

class SearchPeopleScreen extends StatefulWidget {
  const SearchPeopleScreen({Key? key}) : super(key: key);

  @override
  State<SearchPeopleScreen> createState() => _SearchPeopleScreenState();
}

class _SearchPeopleScreenState extends State<SearchPeopleScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _search = "";
  List<UserModel> _results = [];
  List<UserModel> selected = [];
  bool isLoading = false;
  List<String> _historyKeywords = [];
  Timer? _debounce;

  void _reviveHistoryKeywords() {
    var value = GetStorage().read('historyKeywords');
    if (value != null) {
      List<String> list = (jsonDecode(value) as List<dynamic>).cast<String>();

      setState(() => _historyKeywords = list);
    }
  }

  void _removeHistoryKeyword(String keyword) {
    List<String> newList = _historyKeywords;
    newList.remove(keyword);

    setState(() {
      _historyKeywords = newList;
    });
    GetStorage().write("historyKeywords", jsonEncode(newList));
  }

  void _handleChange(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        setState(() {
          isLoading = true;
          _search = value;
        });
        if (value.isNotEmpty) {
          // fetch data
          var response = await API().fetchAllUser(value);
          var usersJSON = response.data['users'];
          List<UserModel> result = [];
          for (int i = 0; i < usersJSON.length; i++) {
            result.add(UserModel.fromJson(usersJSON[i]));
          }
          setState(() {
            isLoading = false;
            _results = result;
          });
        }
      },
    );
  }

  void _updateHistoryKeywords(String value) async {
    if (!_historyKeywords.contains(value)) {
      List<String> newList = _historyKeywords;
      newList.insert(0, value);

      setState(() => _historyKeywords = newList);
      GetStorage().write("historyKeywords", jsonEncode(newList));
    }
  }

  void _updateSelected(List<UserModel> newSelected) {
    setState(() => selected = newSelected);
  }

  @override
  void initState() {
    super.initState();

    _reviveHistoryKeywords();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.search), SizedBox(width: kDefaultPadding)],
        title: SizedBox(
          height: 38,
          child: TextField(
            controller: _searchController,
            onSubmitted: _updateHistoryKeywords,
            onChanged: _handleChange,
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Get.isDarkMode ? Colors.black54 : Colors.white,
              hintStyle: const TextStyle(fontSize: 13),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              hintText: 'Tìm kiếm bạn bè, mọi người...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultRadius / 2),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          selected.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2,
                          horizontal: kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${selected.length + 1} lựa chọn "),
                          InkWell(
                            onTap: () async {
                              List<String> users = [
                                context.read<Auth>().user!.username,
                                ...selected.map((e) => e.username).toList()
                              ];
                              if (users.length <= 2) {
                                NotificationDialog.show(context, "Notification",
                                    "Cannot create group with less than 2 members");
                              } else {
                                var response =
                                    await API().createConversation(users);
                                ConversationModel conversation =
                                    ConversationModel.fromJson(
                                        response.data["conversation"]);

                                Get.toNamed(Routes.chatDetail,
                                    arguments: {"conversation": conversation});
                              }
                            },
                            child: Text(
                              "Tạo cuộc trò chuyện",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selected.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return People(
                              user: context.watch<Auth>().user as UserModel,
                              handleRemove: null,
                            );
                          }
                          return People(
                            user: selected[index - 1],
                            handleRemove: () {
                              _updateSelected(selected
                                  .where((u) => u.id != selected[index - 1].id)
                                  .toList());
                            },
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1, color: Colors.grey),
                  ],
                )
              : Container(),
          Expanded(
            child: _search == ""
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2,
                            horizontal: kDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tìm kiếm gần đây"),
                            Text(
                              "Chỉnh sửa",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _historyKeywords.length,
                          itemBuilder: (context, index) => RowHistory(
                            title: _historyKeywords[index],
                            onRemove: () {
                              _removeHistoryKeyword(_historyKeywords[index]);
                            },
                            onClick: () {
                              _searchController.text = _historyKeywords[index];
                              _handleChange(_historyKeywords[index]);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                : SizedBox(
                    width: double.infinity,
                    child: isLoading
                        ? Column(
                            children: const [
                              SizedBox(height: kDefaultPadding * 2),
                              CircularProgressIndicator(),
                              SizedBox(height: kDefaultPadding),
                              Text(
                                "Loading...",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 2,
                                      horizontal: kDefaultPadding),
                                  child: RichText(
                                    overflow: TextOverflow.clip,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: !isLoading && _results.isEmpty
                                                ? 'Không tìm thấy kết quả nào cho từ khóa: '
                                                : "${_results.length} kết quả tìm kiếm cho từ khóa: "),
                                        TextSpan(
                                          text: "\"$_search\"",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _results.length,
                                  itemBuilder: (context, index) => RowItem(
                                    user: _results[index],
                                    selected: selected,
                                    updateSelected: _updateSelected,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}

class RowHistory extends StatelessWidget {
  const RowHistory(
      {Key? key,
      required this.title,
      required this.onRemove,
      required this.onClick})
      : super(key: key);

  final String title;
  final Function() onRemove;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: kDefaultPadding * 3 / 4),
          child: Row(
            children: [
              Icon(Icons.history, size: 20, color: Colors.grey[600]),
              const SizedBox(width: kDefaultPadding),
              Text(title),
              const Spacer(),
              GestureDetector(
                onTap: onRemove,
                child: const Icon(Icons.close, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
