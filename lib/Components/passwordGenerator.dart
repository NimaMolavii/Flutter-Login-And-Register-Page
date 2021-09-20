

import 'dart:math';

class PassGenerator {

  static String passwordGenerator() {
    Random random = new Random();

    String upperChars = "QWERTYUIOPASDFGHJKLZXCVBNM";
    String lowerChars = "qwertyuiopasdfghjklzxcvbnm";
    String numbers = "0123456789";
    String symbols = "!@#&?<>";
    String passwordSyntax = upperChars + lowerChars + numbers + symbols;

    String password = String.fromCharCodes(
      Iterable.generate
        (15, (_) => passwordSyntax.codeUnitAt
          (random.nextInt(passwordSyntax.length))));
    
    return password;
  }
}





