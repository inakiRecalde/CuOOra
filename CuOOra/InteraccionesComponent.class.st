Class {
	#name : #InteraccionesComponent,
	#superclass : #CabeceraComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
InteraccionesComponent >> darDislike: unPost [
	 unPost darDislike: self session user .
]

{ #category : #callback }
InteraccionesComponent >> darLike: unPost [
	 unPost darLike: self session user.
]

{ #category : #rendering }
InteraccionesComponent >> renderListItem: canvas post: each [
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
InteraccionesComponent >> renderListItem: canvas pregunta: each [
								(canvas anchor 
								callback:[(self verPregunta: each)];
								with: each titulo).
								canvas break.
								canvas text: 'Topicos: '.
								each topicos 
										do: [ :topic | canvas text: topic nombre ].
								canvas break.
								canvas text: 'Respuestas: '.
								canvas text: each cantRespuestas .
								self renderListItem: canvas post: each. 
]

{ #category : #callback }
InteraccionesComponent >> verPregunta: unaPregunta [ 
	self call: (PreguntaComponent pregunta: unaPregunta ).
]
