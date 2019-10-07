"
This class generates getter, setter, insert and update for each of the classes in the model
"
Class {
	#name : #HeySqlCodeGenerator,
	#superclass : #Object,
	#category : #'HeySql-Migrations'
}

{ #category : #initialization }
HeySqlCodeGenerator class >> connectDb [
	"connect to dev database - do not expose variables in prod environment"

	| client |
	client := P3Client new url: 'psql://sakuraeco:sakuraeco@localhost'.
	HeySql connect: client.

]

{ #category : #translating }
HeySqlCodeGenerator class >> generate: theClass [
	"All variables in the class are used as db-variables at the current point. Find these by reflection"

	| dbVars |
	dbVars := (theClass instVarNames collect: [ :v | v asString ])
		joinUsing: ' '.
	theClass init.	
	theClass dbFields: dbVars.
	theClass generateSimpleDbOperationInsert: theClass asString
]
