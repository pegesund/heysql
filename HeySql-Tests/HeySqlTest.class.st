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
	| client|
	super setUp.
	client := P3Client new url: 'psql://foxface:foxfase@localhost'.
	HeySql connect: client.
]

{ #category : #tests }
HeySqlTest >> testPersonCreated [
	"sime test where we create a person"
	| person |
	person := HeySqlPerson new.
	self assert: (person respondsTo: #id).

]
