Feature: Manual Spans

  Scenario: Manual Span
    When I run "ManualSpanScenario"
    And I wait for 1 span
    Then the trace "Content-Type" header equals "application/json"
    * the trace "Bugsnag-Sent-At" header matches the regex "^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d\.\d\d\dZ$"
    * the trace "Bugsnag-Span-Sampling" header equals "1:1"
    * every span field "name" equals "ManualSpanScenario"
    * every span field "spanId" matches the regex "^[A-Fa-f0-9]{16}$"
    * every span field "traceId" matches the regex "^[A-Fa-f0-9]{32}$"
    * every span field "startTimeUnixNano" matches the regex "^[0-9]+$"
    * every span field "endTimeUnixNano" matches the regex "^[0-9]+$"
    * every span bool attribute "bugsnag.span.first_class" is true
    * every span string attribute "bugsnag.span.category" equals "custom"
    * a span double attribute "bugsnag.sampling.p" equals 1.0

  Scenario: Manual Span isFirstClass false
    When I run "ManualSpanIsFirstClassFalseScenario"
    And I wait for 1 span
    Then every span field "name" equals "ManualSpanIsFirstClassFalseScenario"
    * every span bool attribute "bugsnag.span.first_class" is false


  Scenario: Max Batch Age
    When I run "MaxBatchAgeScenario"
    And I wait for 1 span
    Then the trace "Content-Type" header equals "application/json"
    * the trace "Bugsnag-Sent-At" header matches the regex "^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d\.\d\d\dZ$"
    * the trace "Bugsnag-Span-Sampling" header equals "1:1"
    * every span field "name" equals "MaxBatchAgeScenario"
