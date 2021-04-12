Class {
	#name : #PerfilVisitorComponent,
	#superclass : #PerfilComponent,
	#category : #'CuOOra-ui'
}

{ #category : #'accessing structure variables' }
PerfilVisitorComponent >> button: aCanvas [
	(self session user canBefriend: user)
		ifFalse: [ ^[aCanvas anchor
										callback: [ self seguirA: user ];
										with: 'Seguir' ] ];
		ifTrue:[ ^[aCanvas anchor
										callback: [ self dejarDeSeguirA: user ];
										with:'Siguiendo'  ] ].
		

]

{ #category : #callbacks }
PerfilVisitorComponent >> dejarDeSeguirA: anUser [
	self session user dejarDeSeguirUser: anUser
]

{ #category : #rendering }
PerfilVisitorComponent >> renderCabeceraOn: aCanvas [
(self session user canBefriend: user)
		ifTrue: [aCanvas anchor
										callback: [ self seguirA: user ];
										with: 'Seguir' ];
		ifFalse:[aCanvas anchor
										callback: [ self dejarDeSeguirA: user ];
										with:'Siguiendo' ].
aCanvas
		paragraph: [ aCanvas
				text: 'Perfil de ' , self user nombre;
				break;
				text: 'Sus preguntas'.].

			

]

{ #category : #rendering }
PerfilVisitorComponent >> renderContentOn: aCanvas [
	self renderCabeceraOn: aCanvas.
	self renderPreguntasOn: aCanvas.
	self renderbuttonsOn: aCanvas .
]

{ #category : #rendering }
PerfilVisitorComponent >> renderPreguntasOn: aCanvas [
	
	aCanvas
		unorderedList: [ (CuOOra soleInstance preguntasDeUser: self user)
				do: [ :each | 
					aCanvas space.
					aCanvas anchor
						callback: [ self verPregunta: each ];
						with: each titulo ] ]
]

{ #category : #callbacks }
PerfilVisitorComponent >> seguirA: anUser [
	self session user seguirUser: anUser
]

{ #category : #callbacks }
PerfilVisitorComponent >> verPregunta: unaPregunta [ 
	self call: (PreguntaComponent pregunta: unaPregunta ).
]
