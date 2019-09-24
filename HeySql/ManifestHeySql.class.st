"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestHeySql,
	#superclass : #PackageManifest,
	#category : #'HeySql-Manifest'
}

{ #category : #'code-critics' }
ManifestHeySql class >> ruleGRTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#HeySql #addSqlMethods: #false)) #'2019-09-22T12:56:23.2247+02:00') #(#(#RGMethodDefinition #(#'HeySql class' #createTable:tableDict: #true)) #'2019-09-24T13:23:08.732412+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#HeySql)) #'2019-09-15T12:12:41.061929+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'HeySql class' #HeySql)) #'2019-09-15T20:07:49.695875+02:00') #(#(#RGClassDefinition #(#HeySql)) #'2019-09-15T20:14:41.610393+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#HeySql)) #'2019-09-15T12:18:12.149669+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#HeySql)) #'2019-09-15T20:15:19.160354+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#HeySql #addSqlMethods: #false)) #'2019-09-22T13:19:05.871421+02:00') )
]
