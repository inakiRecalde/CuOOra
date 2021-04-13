Class {
	#name : #NewPostPage,
	#superclass : #CabeceraComponent,
	#instVars : [
		'title',
		'desc',
		'top'
	],
	#category : #'CuOOra-ui'
}

{ #category : #callback }
NewPostPage >> agregarTopico: aTopic [ 
	top add: aTopic.
]

{ #category : #accessing }
NewPostPage >> desc [
	^ desc
]

{ #category : #accessing }
NewPostPage >> desc: anObject [
	desc := anObject
]

{ #category : #callback }
NewPostPage >> elegirTopico [ 
	self call: CrearTopicoComponent new.
]

{ #category : #callback }
NewPostPage >> eliminarTopico: aTopic [ 
	top remove: aTopic.
]

{ #category : #initialize }
NewPostPage >> initialize [
	super initialize .
	top:= OrderedCollection new.
]

{ #category : #callback }
NewPostPage >> post [
	title | desc  ifEmpty: [ ^ self ].
	top ifEmpty: [ ^ self ].
	CuOOra soleInstance
		agregarPregunta: 
			(Pregunta titulo: title descripcion:desc topicos: top user: self session user).
	self answer.
]

{ #category : #rendering }
NewPostPage >> renderButtonsOn: aCanvas [
	aCanvas text: 'Publicar post'.
	aCanvas space.
	aCanvas submitButton
				callback: [ self post ];
				with: 'Post' .
	aCanvas break.
	aCanvas break.
	aCanvas text: 'No encuentra el topico ideal ?	 PUEDE CREARLO!!'.
	aCanvas break.
	aCanvas submitButton
				callback: [ self elegirTopico ];
				with: 'Crear topico'.
	
]

{ #category : #rendering }
NewPostPage >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas.
	self renderBackButtonOn: aCanvas.
	aCanvas
		form: [ 
			self renderInputElementOn: aCanvas.
		   self renderButtonsOn: aCanvas]
]

{ #category : #rendering }
NewPostPage >> renderInputElementOn: aCanvas [
	aCanvas
				paragraph: [ aCanvas label: 'Titulo: '.
					aCanvas textInput on: #title of: self ].
			aCanvas
				paragraph: [ aCanvas label: 'Descripcion: '.
					aCanvas textInput on: #desc of: self ].
			aCanvas text: 'Elegir topicos para su pregunta'.
			aCanvas
				unorderedList: [ CuOOra soleInstance topicos
						do: [ :each | 
							aCanvas
								listItem: [ aCanvas anchor
										callback: [ self agregarTopico: each ];
										with: each nombre ] ] ].
			aCanvas text: 'Topicos elegidos: '. aCanvas text: top size.
			aCanvas
				unorderedList: [ top
						do: [ :each | 
							aCanvas
								listItem: [ aCanvas text: each nombre.
									aCanvas space.
									aCanvas anchor
										callback: [ self eliminarTopico: each ];
										with: 'X' ] ] ].
]

{ #category : #callback }
NewPostPage >> title [
	^ title
]

{ #category : #accessing }
NewPostPage >> title: anObject [
	title := anObject
]

{ #category : #accessing }
NewPostPage >> top [
	^ top
]

{ #category : #accessing }
NewPostPage >> top: anObject [
	top := anObject
]
