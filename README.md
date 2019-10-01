# HeySql - a mini-orm for Pharo Smalltalk

## Reason

The older I have got, the more I have started to dislike database orms. They are often hard to migrate, they are hard to debug, and they put not needed pressure on the db with insane long joins for doing pretty simple stuff (oh, yes - JPA - I am talking about you!).

On the other hand one very often do have something like models in the code. Product, customer, purchase and so on - and the boilerplate to get this stuff up and running can be quite boring and time consuming.

HeySql is an attempt to find the right balance between an orm and doing thing in sql.


## Usage

The code is based upon the awesome P3-library for Postgresql.

### This code has been written Pharo Smalltalk

	- Uses reflection
	- Adds methods by compiling in runtime
	- Uses the standard test-system. To run the tests in the test-package you must set up the database propery on your local computer.

If you are intrested in the magnificent smalltalk language, you can read more about my experience writing the library here: placeholder.

### Connecting

```smalltalk
client := P3Client new url: 'psql://test@localhost'.
HeySql connect: client
```

### Automaticall generated functionality

After creating the class, you can just write this piece of code (say you have a class called HeySqlPerson with object vars forname and surname). "person" is the name of the db-table.

```smalltalk
	HeySqlPerson init.
	HeySqlPerson dbFields: 'forname surname'.
	HeySqlPerson generateSimpleDbOperations: 'person'.
```

You will now have this functionality for the class:

	- Getter and setters
	- The object methods insert and update

So you can do:

``` smalltalk
person := HeySqlPerson new.
person forname: 'peter'.
person insert.
```

And the object will be stored in the database. Same goes for update.

### Adding your own functions

It is very easy to add your own queries as well.

```smalltalk
	dict := Dictionary
		newFrom:
			{('personsFindall' -> 'select * from person').
			('personsFindByForename, surname'
				-> 'select * from person where forname = $1 and surname = $2').
			('byId' -> 'select * from person where id = $1')}.
	HeySqlPerson generateSqlMethods: dict.
```

You will now have access to the new defined methods.

Note that the number of $'s must match the number of string separated functions on the left hand side in the dictionary!

```smalltalk
persons := HeySqlPerson personsFindall.
person := HeySqlPerson byId: 1.
persons := HeySqlPerson personsFindByForename: 'petter' surname: 'egesund'
```

Doing queries this way has these advantages:

	- You have the full power of sql, no strange dsl
	- Sql-queries will available as code methods, with parameteres and available in autocomplete. I like prefixing all queries for the person-class with person.. to easy look up methods for the class.
	- This should make the code more readable and be a good starting point for reusing queries.
	- It should be pretty easy to use all the features of the database, ex. json, gis, freetext and so on - which normall not are available in orms.
	- As we use server side compiled statemens it sould be pretty fast and also safe when it somes to hijacking.

### Creating tables

You can use this helper function to create tables, or you can do it your way:

```smalltalk
personTable := {('id' -> 'serial').
	('forname' -> 'text').
	('surname' -> 'text')} asDictionary.
	HeySql createTable: 'person' tableDict: personTable
```

### Database migration

Just change the columns with plain P3-sql, and then rerun the generation methods.

To come: a migration part which connects even more nicely with this library.

### Example usage

This part taken from the tests should illustrate usage of most funcionality.

```smalltalk
testSqlMethodsCreated
	"check that insert works and that it returns correct new id. check that correct sql statements are created for the different methods, and that these give correct result"

	| dict person person2 person3 |
	HeySqlPerson init.
	HeySqlPerson dbFields: 'forname surname'.
	HeySqlPerson generateSimpleDbOperations: 'person'.
	person := HeySqlPerson new.
	person forname: 'petter'.
	person surname: 'egesund'.
	person insert.
	self assert: [ person id == 1 ].
	person2 := HeySqlPerson new.
	person2 forname: 'petter2'.
	person2 surname: 'egesund2'.
	person2 insert.
	self assert: [ person2 id == 2 ].
	dict := Dictionary
		newFrom:
			{('personsFindall' -> 'select * from person').
			('personsFindByForename, surname'
				-> 'select * from person where forname = $1 and surname = $2').
			('byId' -> 'select * from person where id = $1')}.
	HeySqlPerson generateSqlMethods: dict.
	self assert: [ HeySqlPerson personsFindall size == 2 ].
	self
		assert: [ (HeySqlPerson personsFindByForename: 'petter' surname: 'egesund')
				isKindOf: HeySqlPerson ].
	person forname: 'hans petter'.
	person update.
	person3 := HeySqlPerson byId: 1.
	self assert: [ person3 id = 1 ].
	self assert: [ person3 forname = 'hans petter' ]
```


### Implementation and pitfalls

	- Still in version 1-beta.
	- Variables in the classes must have the exact same name as in the datbase. I consider this as a good coding style and as a feature.
	- I do not parse the sql, but use some simple regexps. Normally this should not be a problem, but if your queries due to some strange reasons contains $NUM you might get into trouble. Values to be inserted can off course contain these special characters.
	- These methods does actually generate and compile code for you. If you owerwrite these methods and rerun the generation methods your code will be overwritten.
	- Due to the compile-edit-lifecycle in the gui, you must run the generators before the code is accepted when coding. I use the playground or you can even move the models to a separate package - the models can then be genereatet from the baseline with the #postLoadDoIt function. There are probably many other ways to handle this as well.

### License and usage

This is BSD-license, use it as you would like.

Drop me a line if you use the library for anything - would be cool to know!
