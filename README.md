# FSH+CQL+Measure IG Training Materials

## Getting started with cqf-ruler

```
git clone git@github.com:DBCG/cqf-ruler.git
cd cqf-ruler/
git checkout feature-stratification
mvn jetty:run -am --projects cqf-ruler-r4
```

## Prepare IG

> This repo uses a hybrid CQF Tooling and Publisher pipeline because Publisher is currently using an older version of CQL-ELM that breaks support in FHIR.

Approach:
* Use an XML IG and not the Sushi, including includes/menu.xml not Sushi
* Comment out input/cql binary stuff in XML
* FSHOnly - true in sushi
* mv libraries or publisher errors with duplicate resources

Steps:
```sh
bash _updateCQFTooling.sh
bash _updatePublisher.sh
sushi
mv fsh-generated/resources/Library-* input/resources/
bash _refresh.sh
bash _genonce.sh -no-sushi
```

## Put Resources to cqf-ruler

```sh
cd output ; for FILE in FHIRHelpers AgeRanges Test \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Library/${FILE} ; done ; cd ../
```

```sh
cd output ; for FILE in Test SimpleAgeGroup \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Measure/${FILE} ; done ; cd ..
```

```sh
cat output/Bundle-Example-Test.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir
```

Run $evaluate-measure operations
```
curl -sXPOST 'http://localhost:8080/cqf-ruler-r4/fhir/Measure/BlazeStratifierTest/$evaluate-measure?&periodStart=2000&periodEnd=2030' | jq
curl -sXPOST 'http://localhost:8080/cqf-ruler-r4/fhir/Measure/SimpleAgeGroup/$evaluate-measure?&periodStart=2000&periodEnd=2030' | jq .
```

