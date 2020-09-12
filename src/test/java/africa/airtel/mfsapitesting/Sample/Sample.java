package africa.airtel.mfsapitesting.Sample;

import com.intuit.karate.junit5.Karate;

public class Sample {
	@Karate.Test
    Karate testSample() {
        return Karate.run("Sample").relativeTo(getClass());
    }
}
