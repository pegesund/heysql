"
A HeySqlTest is a test class for testing the behavior of HeySql
"
Class {
	#name : #HeySqlTest,
	#superclass : #TestCase,
	#category : #'HeySql-Tests-Initialize'
}

{ #category : #running }
HeySqlTest >> setUp [
	"set up client and create test object"

	| client personTable |
	super setUp.
	client := P3Client new url: 'psql://foxface:foxface@localhost'.
	HeySql connect: client.
	client execute: 'drop table if exists person '.
	personTable := {('id' -> 'serial').
	('forname' -> 'text').
	('surname' -> 'text')} asDictionary .
	HeySql createTable: 'person' tableDict: personTable
]

{ #category : #tests }
HeySqlTest >> testMethodsCreated [
	"comment stating purpose of instance-side message"
	
	
]

{ #category : #tests }
HeySqlTest >> testNumberOfSqlParams [
	"Test that we get number of params from an sql string. Note not a sql-statement which passes in the test :) "
			
	self assert: ((HeySql findNumberOfParams: 'select * from person where forname = $1 $2 $a') == 2)
]

{ #category : #tests }
HeySqlTest >> testPersonCreated [
	"we create a person, check that we have accessors and this object"

	| person |
	HeySqlPerson setDbFields: 'forname surname'.
	HeySqlPerson generateGettersAndSetters.
	person := HeySqlPerson new.
	self assert: (person respondsTo: #id).
	self assert: (person respondsTo: #forname).
	HeySqlPerson removeSelector: #forname.
	HeySqlPerson removeSelector: #surname.
	HeySqlPerson removeSelector: #forname:.
	HeySqlPerson removeSelector: #surname:.
	self assert: ((HeySqlPerson new respondsTo: #forname) not)
]

{ #category : #tests }
HeySqlTest >> testSqlMethodsCreated [
	"check that correct sql statements are created for the different methods"

	| dict |
	HeySqlPerson setDbFields: 'forname surname'.
	HeySqlPerson generateGettersAndSetters.
	dict := Dictionary
		newFrom:
			{('personsFindall' -> 'select * from person').
			('personsFindOne'
				-> 'select * from person where forname = $1 and surname = $2')}.
	HeySqlPerson generateSqlMethods: dict
]
