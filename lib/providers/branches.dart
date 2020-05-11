import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:stockapptemplate/models/branch.dart';
import 'package:http/http.dart' as http;

class Branches extends ChangeNotifier {
  String _selectedBranchId;
  String _selectedBranchName;

  List<Branch> _branches;

  List<Branch> get branches {
    return [..._branches];
  }

  String get branchId {
    return _selectedBranchId;
  }

  String get branch {
    return _selectedBranchName == null ? "Default" : _selectedBranchName;
  }

  Future<List<Branch>> fetchBranches() async {
    if(_branches != null) return [..._branches];
    _branches = [];
    final response = await http.get('https://derrico-6cb6b.firebaseio.com/branches.json');
    final data = json.decode(response.body) as List;
    for(int i = 0; i < data.length; i++) {
      _branches.add(Branch(i.toString(), data[i]["name"]));
    }
    return [..._branches];
  }

  void selectBranch(String id) {
    _selectedBranchId = id;
    _selectedBranchName = _branches[int.parse(id)].name;
    notifyListeners();
  }


}