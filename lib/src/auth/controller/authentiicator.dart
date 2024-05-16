import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';

import '../model/credential/credential_storage.dart';

class ApiAuthenticator {
  final CredentialStorage credentialStorage;

  ApiAuthenticator({required this.credentialStorage});



  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await credentialStorage.read();

      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          //! TODO: To fix
        }
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }
}


