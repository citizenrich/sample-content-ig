Instance:     Patient-Test
InstanceOf:   Patient
Title: "Patient-Test"
Description: "Patient-Test"
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"

Instance: Example-Test
InstanceOf: Bundle
Title: "Example-Test"
Description: "Example-Test"
* type = #transaction

* entry[+].fullUrl = "http://somewhere.org/fhir/uv/mycontentig/Patient/Patient-Test"
* entry[=].request.url = "Patient"
* entry[=].resource = Patient-Test
* entry[=].request.method = #POST
