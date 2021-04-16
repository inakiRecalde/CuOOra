"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCuOOra,
	#superclass : #PackageManifest,
	#category : #'CuOOra-Manifest'
}

{ #category : #'code-critics' }
ManifestCuOOra class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CabeceraComponent #style #false)) #'2021-04-15T23:40:36.910853-03:00') )
]

{ #category : #'code-critics' }
ManifestCuOOra class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#WelcomePageComponent #renderContentOn: #false)) #'2021-04-02T04:27:47.528942-03:00') )
]
