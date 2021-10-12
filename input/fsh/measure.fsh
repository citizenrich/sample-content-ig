Alias: $OpenHIE = http://somewhere.org/fhir/uv/mycontentig/CodeSystem/OpenHIE

CodeSystem: OpenHIE
Id: OpenHIE
Title: "OpenHIE CodeSystem"
Description: "OpenHIE CodeSystem"
* ^url = $OpenHIE
* #cohort "cohort"

Alias: $measure-scoring = http://terminology.hl7.org/CodeSystem/measure-scoring
Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

Instance: SimpleAgeGroup
InstanceOf: Measure
Title: "SimpleAgeGroup"
Description: "SimpleAgeGroup"
* identifier.system = "http://somewhere.org/fhir/uv/mycontentig/Measure"
* version = "0.0.0"
* status = #draft
* experimental = true
* date = "2021-07-01"
* publisher = "OpenHIE"
* library[+] = Canonical(Test)
* name = "SimpleAgeGroup"
* url = "http://somewhere.org/fhir/uv/mycontentig/Measure/SimpleAgeGroup"
* identifier.value = "SimpleAgeGroup"
* scoring = $measure-scoring#proportion
* group[+]
  * code = $OpenHIE#cohort "cohort"
  * population[+]
    * description = "Initial Population"
    * code = $measure-population#initial-population
    * criteria.language = #text/cql
    * criteria.expression = "Initial Population"
  * population[+]
    * description = "Denominator"
    * code = $measure-population#denominator
    * criteria.language = #text/cql
    * criteria.expression = "Denominator"
  * population[+]
    * description = "Numerator"
    * code = $measure-population#numerator
    * criteria.language = #text/cql
    * criteria.expression = "Numerator"
  * stratifier[0].criteria.language = #text/cql
  * stratifier[=].criteria.expression = "Age Group"