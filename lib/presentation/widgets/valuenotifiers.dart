import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:studdataapp/data/model/student_model.dart';

ValueNotifier<bool> homeView = ValueNotifier(true);
ValueNotifier<Uint8List?> imgPreview = ValueNotifier(null);
ValueNotifier<bool> searchDataPoPUpDisplay = ValueNotifier(false);
ValueNotifier<String> searchValue = ValueNotifier('');
ValueNotifier<List<Object>>? selectQueeryArgs = ValueNotifier([]);
