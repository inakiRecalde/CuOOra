Class {
	#name : #PreguntaComponent,
	#superclass : #HomePage,
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
PreguntaComponent >> renderComentarOn: canvas [
	canvas
		form: [ canvas
				paragraph: [ canvas label: 'realizar comentario '.
					canvas textInput on: #textComent of: self ].
			canvas submitButton
				callback: [ self comentario ];
				with: 'Comentar' ]
]

{ #category : #rendering }
PreguntaComponent >> renderComentariosOn: canvas [
	canvas
		unorderedList: [ pregunta respuestas
				do: [ :each | 
					canvas
						listItem: [ self renderListItem: canvas post: each ]]].
]

{ #category : #rendering }
PreguntaComponent >> renderContentOn: canvas [
	self renderCabecera: canvas.
	self renderBackButtonOn: canvas.
	self renderPreguntaOn: canvas.
	self renderComentariosOn: canvas.
	self renderComentarOn: canvas.
]

{ #category : #rendering }
PreguntaComponent >> renderPreguntaOn: canvas [
	canvas text: pregunta titulo.
	canvas space.
	self renderListItem: canvas post: pregunta.
	canvas space.
	canvas text: 'Respuestas: '. canvas text: pregunta cantRespuestas . 
]

{ #category : #accessing }
PreguntaComponent >> textComent [
	^ textComent
]

{ #category : #accessing }
PreguntaComponent >> textComent: anObject [
	textComent := anObject
]
