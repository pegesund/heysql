Class {
	#name : #HeysqlMigrateTest,
	#superclass : #TestCase,
	#category : #'HeySql-Tests-Manifest'
}

{ #category : #tests }
HeysqlMigrateTest >> testMigrateSimple [
	"generate some migrations methods without content, then run this and make sure migration date is updated"

	| client lastMigration lastMigrationDb |
	HeySqlDbMigrator new: HeySqlMigrations.
	HeySqlDbMigrator updateMigrationTable: 'dummy'.
	client := HeySql connection.
	client execute: 'delete from migrations'.
	HeySqlDbMigrator createMigration.
	lastMigration := HeySqlDbMigrator createMigration.
	HeySqlDbMigrator migrate.
	lastMigrationDb := (client
		query: 'select mdate from migrations where id = 1') data at: 1.
	self assert: [ (lastMigrationDb at: 1) = lastMigration ]
]
