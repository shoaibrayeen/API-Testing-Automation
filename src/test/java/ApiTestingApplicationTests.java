import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.intuit.karate.junit5.Karate;

@SpringBootTest
class ApiTestingApplicationTests {

	@Test
	void contextLoads() {
	}
	
	@Karate.Test
    Karate testSample() {
        return Karate.run("./Sample/Sample").relativeTo(getClass());
    }
}
