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
	client execute: 'drop table if exists heysqlperson '.
	personTable := {('id' -> 'serial').
	('forename' -> 'text').
	('surname' -> 'text')} asDictionary.
	HeySql createTable: 'heysqlperson' tableDict: personTable
]

{ #category : #running }
HeySqlTest >> tearDown [
	"End of tests"

	HeySqlPerson disConnect.
	super tearDown
]

{ #category : #tests }
HeySqlTest >> testNumberOfSqlParams [
	"Test that we get number of params from an sql string. Note not a sql-statement which passes in the test :) "

	self
		assert:
			(HeySql
				findNumberOfParams: 'select * from person where forename = $1 $2 $a')
				== 2
]

{ #category : #tests }
HeySqlTest >> testPersonCreated [
	"we create a person, check that we have accessors and this object"

	| person |
	HeySqlPerson dbFields: 'forename surname'.
	HeySqlPerson generateGettersAndSetters.
	person := HeySqlPerson new.
	self assert: (person respondsTo: #id).
	self assert: (person respondsTo: #forename).
	HeySqlPerson removeSelector: #forename.
	HeySqlPerson removeSelector: #surname.
	HeySqlPerson removeSelector: #forename:.
	HeySqlPerson removeSelector: #surname:.
	self assert: (HeySqlPerson new respondsTo: #forename) not
]

{ #category : #tests }
HeySqlTest >> testSqlMethodsCreated [
	"check that insert works and that it returns correct new id. check that correct sql statements are created for the different methods, and that these give correct result"

	| dict person person2 person3 |
	HeySql init.
	HeySqlPerson dbFields: 'forename surname'.
	(HeySql connection) execute: 'delete from heysqlperson'. 
	person := HeySqlPerson new.
	person forename: 'petter'.
	person surname: 'egesund'.
	person insert.
	self assert: [ person id >= 1 ].
	person2 := HeySqlPerson new.
	person2 forename: 'petter2'.
	person2 surname: 'egesund2'.
	person2 insert.
	self assert: [ person2 id > person id ].
	dict := Dictionary
		newFrom:
			{('personsFindall' -> 'select * from heysqlperson').
			('personsFindByForename, surname'
				-> 'select * from heysqlperson where forename = $1 and surname = $2').
			('byId' -> 'select * from heysqlperson where id = $1')}.
	HeySqlPerson generateSqlMethods: dict.
	self assert: [ HeySqlPerson personsFindall size == 2 ].
	self
		assert: [ (HeySqlPerson personsFindByForename: 'petter' surname: 'egesund')
				isKindOf: HeySqlPerson ].
	person forename: 'hans petter'.
	person update.
	person3 := HeySqlPerson byId: person id.
	self assert: [ person3 id == person id ].
	self assert: [ person3 forename = 'hans petter' ]
]
