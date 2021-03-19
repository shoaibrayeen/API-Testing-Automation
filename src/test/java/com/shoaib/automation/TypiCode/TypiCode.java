package com.shoaib.automation.TypiCode;

import com.intuit.karate.junit5.Karate;

public class TypiCode {

  @Karate.Test
  Karate testApi() {
    return Karate.run("TypiCode").relativeTo(getClass());
  }
}
