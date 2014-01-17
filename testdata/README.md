CTS Test Suite:  version Beta 2 (June 2009)

This directory contains a corpus of test data, a suite of test requests, and expeced XML replies, for evaluating the compliance of a CTS iplementation with the CTS specification.

The unit tests in this version cover required methods of the CTS protocol,
excluding CTS URNs with URN substring references.


Contents:

testrequests.xml	
: A file defining each test with CTS request name, URN,
		any optional parameters and a brief description.
		
expectedreplies		
: A series of XML files with valid reply values for the
		requests defined in tests.xml  The file's base name
		corresponds to the @id attribute on each test's test element.


testcorpus
: Directory with a text inventory and sample texts used in
		the tests.  The ctsvalidator servlet can be used to 
		test how well a CTS implementation serving this test
		corpus generates correct replies as defined in the
		valid reply files.


