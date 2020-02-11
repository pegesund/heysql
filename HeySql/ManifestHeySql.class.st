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
	^ #(#(#(#RGMethodDefinition #(#HeySql #addSqlMethods: #false)) #'2019-09-22T12:56:23.2247+02:00') #(#(#RGMethodDefinition #(#'HeySql class' #createTable:tableDict: #true)) #'2019-09-24T13:23:08.732412+02:00') #(#(#RGMethodDefinition #(#'HeySqlDbMigrator class' #createMigrationPackage: #true)) #'2019-10-13T10:47:31.141202+02:00') #(#(#RGMethodDefinition #(#'HeySql class' #generateSimpleDbOperationInsert: #true)) #'2019-12-21T18:22:25.588399+01:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'HeySql class' #toObject: #true)) #'2019-09-29T20:54:04.108885+02:00') #(#(#RGMetaclassDefinition #(#'HeySqlDbMigrator class' #HeySqlDbMigrator)) #'2019-10-07T17:56:48.559046+02:00') #(#(#RGMethodDefinition #(#'HeySql class' #dbFields #true)) #'2019-10-13T13:59:11.852651+02:00') #(#(#RGMethodDefinition #(#'HeySql class' #packageDbSetup: #true)) #'2019-11-09T12:02:38.249442+01:00') #(#(#RGPackageDefinition #(#HeySql)) #'2019-12-21T17:10:34.380997+01:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#HeySql)) #'2019-09-15T12:12:41.061929+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'HeySql class' #HeySql)) #'2019-09-15T20:07:49.695875+02:00') #(#(#RGClassDefinition #(#HeySql)) #'2019-09-15T20:14:41.610393+02:00') #(#(#RGMetaclassDefinition #(#'HeySqlDbMigrator class' #HeySqlDbMigrator)) #'2019-10-07T17:56:34.323547+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBGlobalVariablesUsageV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'HeySqlDbMigrator class' #HeySqlDbMigrator)) #'2019-10-07T17:56:39.662978+02:00') #(#(#RGMethodDefinition #(#'HeySql class' #generateSimpleDbOperationInsert: #true)) #'2019-10-13T11:19:17.507804+02:00') #(#(#RGMetaclassDefinition #(#'HeySql class' #HeySql)) #'2019-10-13T11:20:05.5041+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'HeySqlDbMigrator class' #packageDbSetup: #true)) #'2019-11-09T11:54:23.261629+01:00') #(#(#RGMethodDefinition #(#'HeySqlPool class' #init:size: #true)) #'2020-02-09T21:22:10.891422+01:00') #(#(#RGMethodDefinition #(#HeySqlPoolElement #addStatement:sql: #false)) #'2020-02-09T23:18:02.964118+01:00') #(#(#RGMethodDefinition #(#'HeySql class' #getPool #true)) #'2020-02-11T19:46:09.06733+01:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'HeySqlDbMigrator class' #HeySqlDbMigrator)) #'2019-11-03T15:02:00.831036+01:00') )
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
ManifestHeySql class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'HeySql class' #toObject: #true)) #'2019-09-29T20:57:57.09157+02:00') #(#(#RGMethodDefinition #(#'HeySqlDbMigrator class' #createMigrationPackage: #true)) #'2019-10-07T17:56:28.726053+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#HeySql #update #false)) #'2020-02-11T18:54:33.289957+01:00') #(#(#RGMethodDefinition #(#HeySql #insert #false)) #'2020-02-11T18:54:37.657875+01:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBToDoCollectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'HeySqlPool class' #init:size: #true)) #'2020-02-09T21:21:30.842655+01:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#HeySql)) #'2019-10-07T18:00:05.09807+02:00') )
]

{ #category : #'code-critics' }
ManifestHeySql class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#HeySql #addSqlMethods: #false)) #'2019-09-22T13:19:05.871421+02:00') )
]
