Class {
	#name : #HeysqlMigrateTest,
	#superclass : #TestCase,
	#category : #'HeySql-Tests-Manifest'
}

{ #category : #tests }
HeysqlMigrateTest >> testMigrateSimple [
	"generate some migrations methods without content, then run this and make sure migration date is updated."

	| lastMigration lastMigrationDb |
	HeySql init: 'psql://foxface:foxface@localhost/foxface'.
	HeySqlDbMigrator new: HeySqlMigrations.
	HeySqlDbMigrator createMigration.
	lastMigration := HeySqlDbMigrator createMigration.
	HeySqlDbMigrator migrate.
	HeySql getPool withConnection: [ :client | lastMigrationDb := (client query: 'select mdate from migrations where id = 1') data at: 1 ].
	self assert: [ (lastMigrationDb at: 1) = lastMigration ].
	HeySql closePool. 
]
