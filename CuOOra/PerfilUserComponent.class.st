Class {
	#name : #PerfilUserComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
PerfilUserComponent >> renderContentOn: aCanvas [
	self renderPreguntasOn: aCanvas.
	self renderbuttonsOn: aCanvas .
]

{ #category : #rendering }
PerfilUserComponent >> renderPreguntasOn: aCanvas [
	aCanvas text: 'Mis preguntas'.
	aCanvas unorderedList: [ 
			(CuOOra soleInstance preguntasDeUser: self session user)
										do: [ :each | aCanvas anchor 
													callback: [];
													with: each titulo ] ] .
]

{ #category : #rendering }
PerfilUserComponent >> renderbuttonsOn: aCanvas [
	aCanvas anchor 
			callback: [ self answer];
			with: [ aCanvas button: 'volver' ].
]
