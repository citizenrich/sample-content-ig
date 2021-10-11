Alias: $library-type = http://terminology.hl7.org/CodeSystem/library-type

Instance: Test
InstanceOf: Library
Title: "Test"
Description: "Test"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "Test"
* version = "0.1.0"
* url = "http://somewhere.org/fhir/uv/mycontentig/Library/Test"
* content.id = "ig-loader-Test.cql"

Instance: FHIRHelpers
InstanceOf: Library
Title: "FHIRHelpers"
Description: "FHIRHelpers"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "FHIRHelpers"
* version = "4.0.1"
* url = "http://somewhere.org/fhir/uv/mycontentig/Library/FHIRHelpers"
* content.id = "ig-loader-FHIRHelpers.cql"

Instance: AgeRanges
InstanceOf: Library
Title: "AgeRanges"
Description: "AgeRanges"
* status = #draft
* experimental = true
* type = $library-type#logic-library
* name = "AgeRanges"
* version = "0.1.0"
* url = "http://somewhere.org/fhir/uv/mycontentig/Library/AgeRanges"
* content.id = "ig-loader-AgeRanges.cql"
