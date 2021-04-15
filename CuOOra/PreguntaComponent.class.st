Class {
	#name : #PreguntaComponent,
	#superclass : #RecursosCompartidosComponent,
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
						listItem: [ canvas text: each text.
							canvas break. 
							self renderListItem: canvas post: each ]]].
]

{ #category : #rendering }
PreguntaComponent >> renderContentOn: canvas [
	self renderCabecera: canvas.
	self renderBackButtonOn: canvas.
	
	self renderListItem: canvas preguntaEnDetalle: pregunta.
	
	self renderComentariosOn: canvas.
	self renderComentarOn: canvas.
]

{ #category : #accessing }
PreguntaComponent >> textComent [
	^ textComent
]

{ #category : #accessing }
PreguntaComponent >> textComent: anObject [
	textComent := anObject
]
