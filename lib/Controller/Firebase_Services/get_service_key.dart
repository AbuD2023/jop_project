import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    try {
      final scopes = [
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/firebase.database',
        'https://www.googleapis.com/auth/firebase.messaging',
      ];

      final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
          {
            "type": "service_account",
            "project_id": "jop-project-6e8d3",
            "private_key_id": "f0157855a2ab17528fbc248d552863fe54b50d79",
            "private_key":
                "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDHWni4EJWa1/pp\nM/suwZJBmV56qzH8FcDEmnODSfoDb2hRIdL6qCLFxd04oh+qhQ5iyiyHapty5KZP\ndEg8mQGFv1h/IM6KQlW55Yty3EtXVz5dZVPnuURIfQY6v+ZXaPEqGBzCqYBmsGXu\n+9MERQwxzwwoqSIv0vG6m5KA4DaGEkWX9C+JZmpmIahnljgOON90RpsoKeMDR275\nI0xps9AId4V29hoB2VZVkyoJ9hiFoRg8+YdnPyNaIzBuHKZsKb7opkfPQRT5txPc\nVmf4AMQtREa0hDSr3VS8J1HMAKa19kbjo4v0FNMUhir5hwXh0MUC42HaK5cju7gJ\n+6DFNCpbAgMBAAECggEACk09OnB2Sq9+hpE5GbbHEry/indDo1M8cuxzAQXW9aEm\n3Ypx7KIOVJ9fnzLsOqjwOrVX4meP65AFSCB/hczNAgGxVmB2S+QW/1RCsId8coxU\n8glFHLm7iENttFDWW7irPbxL6tiiL1b47YX15vKVKWhu/cA/vq5CmkdlJWPGGDIi\nJ5ejDGEvCRBI0YD5l/alYhXsTblaAtwM4qCbyh46TefeQsB2f+BgRSBn638BWSbF\nxcnxDPFtiVCip6Xi979tV5WSiMY6pxhxXlpgRFON3OH7fis6QWM4R9+F2IafMvGI\npOn+tuPijUlZ76Da2jbk5xX5RIl337qz/1/7Mx6GAQKBgQDsEgR3sNRbVraPGxe6\neIRvj631DUA5LbxM1ofhfQ5IXTkFZeqWEJWnyX77Q8d/41Wa5FFf7mae2ySZJHIn\nNDxaVGeHV7gZlttRCkarc7bWBnM6KS/zyOVv1LZ21EUKfPRQ5VbLVKtrjEmh0UzQ\ndviChubsNgQ6L+mCftInn7y8CwKBgQDYLuwXffHzrYEhOgPmiMkywq7xnx8ZywGt\nuZMSOhm0tfcHh0OpAa1Lw0JdcjThyzSXaGa66FSzqKg36+SN6SHSG+LgCZ5+NXjA\nsbpffL5GaIqrxuPxuNQW3MWwboad6yT3HlovbAPnPfal6IU1Yw2KzQDeEZqIM1Lv\ncKgRtKfs8QKBgFmc5VFCMPqTSi28zR8eDLgExLZXV1/dOrO4ZFB2lmtl5/VioNBi\nb00IMknTivHDLIXl0fYmm5IGAjiYGzVCoP5xN/Oqmtor6Ak1a2o+PNO2Exuq8ucK\nBf6TssgdADBhCqWCyZXaCFCFKpZgy1X/M4rpBtP4FVa5RV0iI0ijXJPNAoGBANRa\ngx8wYBL1Q/rXei1iAAEUq7Q8kdhMSYHU4FrvJ4ETnWyPui6xrwDU9MPGA5wod6ii\nrQa8YTd5XIRR+1hKwSYarmlUCZQAAnWGH4TcjCutVUoXPKGc5PjwNGBysVk+Ojlk\nX0Jl4A+uFjIyjWc7vXmylj+NGzbe84CwMOfzhWCBAoGBAK/y7Uttzr2uLqT+Y5bb\nGf998pNDTXV8F0v/yYNZaLRwZrt2+mrnHYI8EyOB1yQ8BsejpicD+dXGxmAhO2BI\niX6AzqMro0kO6cpnIkp53DDzEYX6yDqMjC3uP14KBSbuPz75wV4CpTZPtYK3rpZ8\n/GlUoFad3CRPdbEQjjw938XM\n-----END PRIVATE KEY-----\n",
            "client_email":
                "firebase-adminsdk-fbsvc@jop-project-6e8d3.iam.gserviceaccount.com",
            "client_id": "110256562604526174216",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url":
                "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url":
                "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40jop-project-6e8d3.iam.gserviceaccount.com",
            "universe_domain": "googleapis.com"
          },
        ),
        scopes,
      );
      final accessServerKey = client.credentials.accessToken.data;
      return accessServerKey;
    } catch (e) {
      return 'null';
    }
  }
}
