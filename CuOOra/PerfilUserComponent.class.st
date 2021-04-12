Class {
	#name : #PerfilUserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
PerfilUserComponent class >> user: aUser [
	^self new 
		user: aUser.
]

{ #category : #rendering }
PerfilUserComponent >> renderContentOn: aCanvas [
	self renderPreguntasOn: aCanvas.
	self renderbuttonsOn: aCanvas .
]

{ #category : #rendering }
PerfilUserComponent >> renderPreguntasOn: aCanvas [
	aCanvas text: 'Perfil de', self user nombre .
	aCanvas unorderedList: [ 
			(CuOOra soleInstance preguntasDeUser: self user)
										do: [ :each | aCanvas space. aCanvas anchor 
													callback: [];
													with: each titulo ] ] .
]

{ #category : #rendering }
PerfilUserComponent >> renderbuttonsOn: aCanvas [
	aCanvas anchor 
			callback: [ self answer];
			with: [ aCanvas button: 'volver' ].
]

{ #category : #accessing }
PerfilUserComponent >> user [
	^ user
]

{ #category : #accessing }
PerfilUserComponent >> user: anObject [
	user := anObject
]
