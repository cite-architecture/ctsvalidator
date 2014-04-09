#ctsvalidator#

A test suite and accompanying servlet to validate compliance of CTS instances with the CTS API.  It currently uses schemas for CTS 5.0.rc.2.

The test suite includes an archive of texts in three different formats for loading into a CTS instance, together with a CTS TextInventory identifying the texts.  The three formats are equivalent under the OHCO2 model:

1. an archival text format.  Examples include both namespaced XML, and non-namespaced XML.  Files are in `testdata/testcorpus_texts`, with accompanying text inventory in `src/main/webapp/testdata/inventory.xml`.
2. a tabular representation.  Files are in `src/main/webapp/testdata/testcorpus_tabs`.
3. an RDF representation in TTL format.  Data are in a single file, `src/main/webapp/testdata/testcorpus.ttl`.

To run the validator, the test archive should first be loaded into the implementation to test using the information from the TextInventory and any one of the three equivalent data sources.

This version of `ctsvalidator` uses the Relax NG schemas from version 5.0.rc.2 of the CTS specification to test syntax of replies.  In addition to validating syntax, it compares the contents of those sections of replies that are fully determined by the CTS specification.  It first normalizes both the expected result and the actual result to the same Unicode representation, then normalizes the XML representation of expected and actual result, and performs a test for XML equivalence of the two pieces of data.


## Running the test suite interactively ##

Requires:  [gradle](http://gradle.org), version 1.11 or higher

Run

    gradle  jettyRunWar

Point your browser at <http://localhost:8080/ctsvalidator> to supply the URL of the running CTS implementation you want to test.

This is just the standard `jettyRunWar` gradle task:  you can configure the servlet container any way you like.  To install the servlet in your own container, run

    gradle war

and add the resulting `.war` file to your container.

 
