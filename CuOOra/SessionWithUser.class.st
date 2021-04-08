Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #'as yet unclassified' }
SessionWithUser >> isLoggedIn [
    ^ user isNil not
]

{ #category : #'as yet unclassified' }
SessionWithUser >> login: aString [
    user := aString
]

{ #category : #'as yet unclassified' }
SessionWithUser >> logout [
    user := nil
]

{ #category : #accessing }
SessionWithUser >> user [
	^ user
]

{ #category : #accessing }
SessionWithUser >> user: anObject [
	user := anObject
]
