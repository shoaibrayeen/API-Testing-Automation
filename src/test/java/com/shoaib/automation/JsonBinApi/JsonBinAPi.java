package com.shoaib.automation.JsonBinApi;

import com.intuit.karate.junit5.Karate;

public class JsonBinAPi {

  @Karate.Test
  Karate testApi() {
    return Karate.run("JsonBinApi").relativeTo(getClass());
  }
}
