# FSH+CQL+Measure IG Training Materials

## Getting started with cqf-ruler

In another terminal...
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


Prep repo:
```
git@github.com:citizenrich/sample-content-ig.git
cd sample-content-ig
bash _updateCQFTooling.sh
bash _updatePublisher.sh
```

Steps:
```sh
rm input/resources/Library-*
sushi
mv fsh-generated/resources/Library-* input/resources/
bash _refresh.sh
bash _genonce.sh -no-sushi
```

## Put Resources to cqf-ruler

Load FHIR-ModelInfo just to be sure
```sh
curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-FHIR-ModelInfo.json http://localhost:8080/cqf-ruler-r4/fhir/Library/FHIR-ModelInfo | jq .
```

```sh
cd output ; for FILE in FHIRHelpers AgeRanges Test \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Library-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Library/${FILE} | jq . ; done ; cd ../
```

```sh
cd output ; for FILE in SimpleAgeGroup \
; do curl -X PUT -H "Content-Type: application/fhir+json" --data @Measure-${FILE}.json http://localhost:8080/cqf-ruler-r4/fhir/Measure/${FILE} | jq . ; done ; cd ..
```

```sh
cat output/Bundle-Example-Test.json | curl -X POST -H "Content-Type: application/fhir+json" --data-binary @- http://localhost:8080/cqf-ruler-r4/fhir | jq .
```

Run $evaluate-measure operations
```sh
curl 'http://localhost:8080/cqf-ruler-r4/fhir/Measure/SimpleAgeGroup/$evaluate-measure?&periodStart=1970&periodEnd=2021' | jq .
# curl -sXPOST 'http://localhost:8080/cqf-ruler-r4/fhir/Measure/SimpleAgeGroup/$evaluate-measure?&periodStart=1970&periodEnd=2021' | jq
```

