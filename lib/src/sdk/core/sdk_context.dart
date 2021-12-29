// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:io' show Platform;
import '../../_library_context.dart' show IsolateOrigin, LibraryContext;

class SdkContext {
  static void init(IsolateOrigin isolateOrigin) {
    LibraryContext.init(isolateOrigin, nativeLibraryPath: _getLibraryName());
  }

  static String _getLibraryName() {
    if (Platform.isIOS) return '';
    return 'libheresdk.so';
  }
}
