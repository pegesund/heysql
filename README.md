# HeySql - a mini-orm for Pharo Smalltalk

## Reason

The older I have got, the more I have started to dislike database orms. They are often hard to migrate, they are hard to debug, and they put not needed pressure on the db with insane long joins for doing pretty simple stuff (oh, yes - JPA - I am talking about you!).

On the other hand one very often do have something like models in the code. Product, customer, purchase and so on - and the boilerplate to get this stuff up and running can be quite boring in time consuming.

HeySql is an attempt to find the right balance between an orm and doing thing in sql.

## Usage

The code is based upon the awesom P3-library for Postgresql.

### Connecting

client := P3Client new url: 'psql://test@localhost'.
HeySql connect: client

### Automaticall generated functionality

After creating the class you can just write this piece of code (say you have a class called HeySqlPerson with object vars forname and surname'

```smalltalk
	HeySqlPerson init.
	HeySqlPerson dbFields: 'forname surname'.
	HeySqlPerson generateSimpleDbOperations: 'person'.
```

You will now have this functionality for this class:

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

You will now have access to the the methods.

```smalltalk
persons := HeySqlPerson personsFindall.
person := HeySqlPerson byId: 1.
persons := HeySqlPerson personsFindByForename: 'petter' surname: 'egesund'
```

