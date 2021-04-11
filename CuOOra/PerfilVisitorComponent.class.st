Class {
	#name : #PerfilVisitorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
PerfilVisitorComponent >> renderContentOn: aCanvas [
	self renderPreguntasOn: aCanvas.
	self renderbuttonsOn: aCanvas .
]

{ #category : #rendering }
PerfilVisitorComponent >> renderPreguntasOn: aCanvas [
	aCanvas text: 'Preguntas de ', self user nombre .
	aCanvas unorderedList: [ 
			(CuOOra soleInstance preguntasDeUser: self user)
										do: [ :each | aCanvas space. aCanvas anchor 
													callback: [];
													with: each titulo ] ] .
]

{ #category : #rendering }
PerfilVisitorComponent >> renderbuttonsOn: aCanvas [
	aCanvas anchor 
			callback: [ self answer];
			with: [ aCanvas button: 'volver' ].
]

{ #category : #accessing }
PerfilVisitorComponent >> user [
	^ user
]

{ #category : #accessing }
PerfilVisitorComponent >> user: anObject [
	user := anObject
]
