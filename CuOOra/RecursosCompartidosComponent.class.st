Class {
	#name : #RecursosCompartidosComponent,
	#superclass : #CabeceraComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
RecursosCompartidosComponent >> darDislike: unPost [
	 unPost darDislike: self session user .
]

{ #category : #callback }
RecursosCompartidosComponent >> darLike: unPost [
	 unPost darLike: self session user.
]

{ #category : #rendering }
RecursosCompartidosComponent >> renderListItem: canvas post: each [
	canvas break.
	canvas text: 'Realizada por: '.
	canvas anchor
		callback: [ self
				perfilUser: (CuOOra soleInstance buscarUsuario: each user nombre) ];
		with: each user nombre.
	canvas break.
	canvas anchor
		callback: [ self darLike: each ];
		with: 'like'.
	canvas space.
	canvas text: each cantLikes.
	canvas space.
	canvas anchor
		callback: [ self darDislike: each ];
		with: 'Dislike'.
	canvas space.
	canvas text: each cantDislikes.
]

{ #category : #rendering }
RecursosCompartidosComponent >> renderListItem: canvas pregunta: each [
								canvas break.
								canvas text: 'Topicos: '.
								each topicos 
										do: [ :topic | canvas text: topic nombre ].
								canvas break.
								canvas text: 'Respuestas: '.
								canvas text: each cantRespuestas .
								self renderListItem: canvas post: each. 
]

{ #category : #rendering }
RecursosCompartidosComponent >> renderListItem: canvas preguntaEnDetalle: pregunta [
	self renderTitulo: canvas pregunta: pregunta.
	canvas break.
	canvas text: pregunta text.
	self renderListItem: canvas pregunta: pregunta. 
]

{ #category : #rendering }
RecursosCompartidosComponent >> renderTitulo: canvas pregunta: pregunta [ 	
			(canvas anchor 
			callback:[(self verPregunta: pregunta)];
			with: pregunta titulo).
]

{ #category : #callback }
RecursosCompartidosComponent >> verPregunta: unaPregunta [ 
	self call: (PreguntaComponent pregunta: unaPregunta ).
]
