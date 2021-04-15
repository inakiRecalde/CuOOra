Class {
	#name : #PerfilComponent,
	#superclass : #RecursosCompartidosComponent,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
PerfilComponent >> renderPreguntasOn: aCanvas [
	aCanvas
		unorderedList: [ (CuOOra soleInstance preguntasDeUser: self user)
				do: [ :each | 
					self renderTitulo: aCanvas pregunta:each. 
					self renderListItem: aCanvas pregunta: each.  ]]
]

{ #category : #accessing }
PerfilComponent >> user [
	^ user
]

{ #category : #accessing }
PerfilComponent >> user: anObject [
	user := anObject
]
