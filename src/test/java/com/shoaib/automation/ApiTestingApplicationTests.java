package com.shoaib.automation;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.intuit.karate.junit5.Karate;

@SpringBootTest(classes = com.shoaib.automation.ApiTestingApplicationTests.class)
class ApiTestingApplicationTests {

	public static String getCurrentDateTime() {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy HH-mm-ss");
		return formatter.format(date);
	}

	public static void generateReport(String karateOutputPath, String report_header) {
		Collection<File> jsonFiles = FileUtils
				.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
		List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("report/cucumber-report/" + getCurrentDateTime()), report_header);
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}

	// Run all feature files include in the respective classes
	@Test
	void testAllFeatureFiles() {
		Results results = Runner.parallel(getClass(), 10, "report/surefire-reports/" + getCurrentDateTime());
		generateReport(results.getReportDir(), "Automation Testing");
		assertTrue(results.getFailCount() == 0, results.getErrorMessages());
	}
	
	@Karate.Test
    Karate testApis() {
			return Karate.run(new String[]{
					"./JsonBinApi/JsonBinApi",
					"./TypiCode/TypiCode"
			}).relativeTo(this.getClass());
    }
}
