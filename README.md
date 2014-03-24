#ctsvalidator#

A test suite and accompanying `gradle` build to validate compliance of CTS instances with the CTS API.  It currently uses schemas for CTS 5.0.rc.1.

The test suite includes an archive of texts in three different formats for loading into a CTS instance, together with a CTS TextInventory identifying the texgts.  The three formats are equivalent under the OHCO2 model of texts:

- an archival text format.  Examples include namespaced XML, non-namespaced XML, and markown.
- a tabular representation
- an RDF representation in TTL format

To run the validator, the test archive should first be loaded into the implementation to test using the information from the TextInventory and any one of the three equivalent data sources.

This version of `ctsvalidator` uses the Relax NG schemas from version 5.0.rc.1 of the CTS specification to test syntax of replies.  In addition to validating syntax, it compares the contents of those sections of replies that are fully determined by the CTS specification.  It first normalizes both the expected result and the actual result to the same Unicode representation, then normalizes the XML representation of expected and actual result, and performs a test for XML equivalence of the two pieces of data.


## Running the test suite interactively ##

Requires:  [gradle](http://gradle.org)

Run

    gradle  jettyRunWar

Point your browser at <http://localhost:8080/ctsvalidator> to suplly the URL of the running CTS implementation you want to test.

## Running the test suite automatically ##

TBA.  (Not yet implemented.)
Run

    gradle -Ptesturl=BASEURL jettyRunWar
 
