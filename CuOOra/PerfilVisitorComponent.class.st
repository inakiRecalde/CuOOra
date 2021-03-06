Class {
	#name : #PerfilVisitorComponent,
	#superclass : #PerfilComponent,
	#category : #'CuOOra-ui'
}

{ #category : #'accessing structure variables' }
PerfilVisitorComponent >> button: aCanvas [
	(self session user puedeSeguirA: user)
		ifFalse: [ ^[aCanvas anchor
										callback: [ self seguirA: user ];
										with: 'Seguir' ] ];
		ifTrue:[ ^[aCanvas anchor
										callback: [ self dejarDeSeguirA: user ];
										with:'Siguiendo'  ] ].
		

]

{ #category : #callbacks }
PerfilVisitorComponent >> dejarDeSeguirA: anUser [
	self session user dejarDeSeguirA: anUser
]

{ #category : #rendering }
PerfilVisitorComponent >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas.
	self renderBackButtonOn: aCanvas.
	
	self renderFollowsButtonsOn: aCanvas.
	self renderPreguntasOn: aCanvas.
]

{ #category : #rendering }
PerfilVisitorComponent >> renderFollowsButtonsOn: aCanvas [
(self session user puedeSeguirA: user)
		ifTrue: [aCanvas anchor
										callback: [ self seguirA: user ];
										with: 'Seguir' ];
		ifFalse:[aCanvas anchor
										callback: [ self dejarDeSeguirA: user ];
										with:'Siguiendo' ].

	aCanvas heading
			level: 2;
			with: user nombre.	

]

{ #category : #rendering }
PerfilVisitorComponent >> renderPreguntasOn: aCanvas [
	aCanvas heading
			level: 2;
			with: 'Sus preguntas'.	
	super renderPreguntasOn: aCanvas.
]

{ #category : #callbacks }
PerfilVisitorComponent >> seguirA: anUser [
	self session user seguirUser: anUser
]

{ #category : #callbacks }
PerfilVisitorComponent >> verPregunta: unaPregunta [ 
	self call: (PreguntaComponent pregunta: unaPregunta ).
]
