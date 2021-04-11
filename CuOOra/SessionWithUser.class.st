Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
SessionWithUser >> isLoggedIn [
    ^ user isNil not
]

{ #category : #accessing }
SessionWithUser >> login: aString [
    user := aString
]

{ #category : #accessing }
SessionWithUser >> logout [
    user := nil
]

{ #category : #accessing }
SessionWithUser >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
SessionWithUser >> user [
	^ user
]

{ #category : #accessing }
SessionWithUser >> user: anObject [
	user := anObject
]
