library Test version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

include AgeRanges version '0.1.0' called AR

context Patient

define "Gender":
  Patient.gender

define "Sex":
  Patient.gender.value

define "Initial Population":
  true

define "Denominator":
  "Sex" is not null

define "Numerator":
  "Sex" = 'female'

define "Age Group/Sex":
  AR."Age Group".code + ':' + "Sex"

define "Age Group":
  AR."Age Group"
