tests
testConflict1
  Metacello new
    configuration: 'Conflict';
    version: '2.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  Metacello new
    configuration: 'Conflict';
    version: '2.1.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    onConflict: [ :ex | ex useLoaded ];
    load.
  self
    validateExpectedConfigurationClassName: 'ConfigurationOfConflict'
    expectedConfigurationVersion: '2.1.0'
    expectedConfigurationRepository:
      'filetree://' , configurationDirectory fullName
    expectedBaselineClassName: nil
    expectedBaselineVersion: nil
    expectedBaselineRepository: nil.
  self
    validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
    expectedConfigurationVersion: '0.9.0'
    expectedConfigurationRepository:
      'dictionary://Metacello_Conflict_Test_Repository'
    expectedBaselineClassName: nil
    expectedBaselineVersion: nil
    expectedBaselineRepository: nil