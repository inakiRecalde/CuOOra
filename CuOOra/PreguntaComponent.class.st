Class {
	#name : #PreguntaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta',
		'textComent'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
PreguntaComponent class >> pregunta: unaPregunta [ 
	^self new pregunta: unaPregunta .
]

{ #category : #callback }
PreguntaComponent >> comentario [

	textComent ifEmpty: [ ^ self ].
	pregunta respuestas: (Respuesta text: textComent  user:self session user ).
	self answer.
]

{ #category : #callback }
PreguntaComponent >> darDislike: unPost [
	 unPost darDislike: self session user.
]

{ #category : #callback }
PreguntaComponent >> darLike: unPost [
	 unPost darLike: self session user.
]

{ #category : #callback }
PreguntaComponent >> perfilUser: aUser [
|perfil|
	perfil :=PerfilVisitorComponent new.
	perfil user: aUser.
	self call: perfil .
]

{ #category : #accessing }
PreguntaComponent >> pregunta [
	^ pregunta
]

{ #category : #accessing }
PreguntaComponent >> pregunta: anObject [
	pregunta := anObject
]

{ #category : #rendering }
PreguntaComponent >> renderContentOn: canvas [
	canvas heading: 'CuOOra'.
	canvas text: pregunta titulo.
	canvas space.
	canvas text: 'Realizada por: '.
	canvas anchor
		callback: [ self
				perfilUser: (CuOOra soleInstance buscarUsuario: pregunta user nombre) ];
		with: pregunta user nombre.
	canvas space.
	canvas text: 'Descripcion: ' , pregunta text.
	canvas space.
	canvas text: 'Respuestas: '.
	canvas space.
	canvas anchor
		callback: [ self darLike: pregunta ];
		with: 'like'.
	canvas space.
	canvas text: pregunta cantLikes.
	canvas anchor
		callback: [ self darDislike: pregunta ];
		with: 'Dislike'.
	canvas space.
	canvas text: pregunta cantDislikes.
	"comentarios"
	canvas text: 'Respuestas'.
	canvas
		unorderedList: [ pregunta respuestas
				do: [ :each | 
					canvas
						listItem: [ canvas text: each text.
							canvas space.
							canvas text: 'Realizada por: '.
							canvas anchor
								callback: [ self
										perfilUser: (CuOOra soleInstance buscarUsuario: each user nombre) ];
								with: each user nombre.
							canvas space.
							canvas anchor
								callback: [ self darLike: pregunta ];
								with: 'like'.
							canvas space.
							canvas text: pregunta cantLikes.
							canvas anchor
								callback: [ self darDislike: pregunta ];
								with: 'Dislike'.
							canvas space.
							canvas text: pregunta cantDislikes ] ] ].
	canvas
		form: [ canvas
				paragraph: [ canvas label: 'realizar comentario '.
					canvas textInput on: #textComent of: self ].
			canvas submitButton
				callback: [ self comentario ];
				with: 'Comentar' ]
]

{ #category : #accessing }
PreguntaComponent >> textComent [
	^ textComent
]

{ #category : #accessing }
PreguntaComponent >> textComent: anObject [
	textComent := anObject
]
