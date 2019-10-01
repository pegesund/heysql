"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfHeysql,
	#superclass : #PackageManifest,
	#category : #'BaselineOfHeySql-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfHeysql class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#BaselineOfHeySql)) #'2019-10-01T09:26:51.26739+02:00') )
]

{ #category : #'code-critics' }
ManifestBaselineOfHeysql class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#BaselineOfHeySql #baselineOf: #false)) #'2019-10-01T09:33:27.333231+02:00') )
]
