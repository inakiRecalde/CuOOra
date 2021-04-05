Class {
	#name : #CuOOraSessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
CuOOraSessionWithUser >> user [
	^ user
]

{ #category : #accessing }
CuOOraSessionWithUser >> user: anObject [
	user := anObject
]
