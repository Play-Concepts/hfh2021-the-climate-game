import 'package:climategame/utils/service_config.dart';
import 'package:jose/jose.dart';

class AuthService {
  String loginUrl() => '$dsLoginUrl?application_id=$dsApplicationId&redirect_uri=$dsCallbackUrl';

  String extractPda(String token) {
    var signature = JsonWebSignature.fromCompactSerialization(token);
    return signature.unverifiedPayload.jsonContent['iss'];
  }
}