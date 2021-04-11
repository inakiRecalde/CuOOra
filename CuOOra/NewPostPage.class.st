Class {
	#name : #NewPostPage,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'desc',
		'top'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
NewPostPage >> desc [
	^ desc
]

{ #category : #accessing }
NewPostPage >> desc: anObject [
	desc := anObject
]

{ #category : #callback }
NewPostPage >> post [
	title | desc | top ifEmpty: [ ^ self ].
	CuOOra soleInstance
		agregarPregunta: 
			(Pregunta titulo: title descripcion:desc topicos: top user: self session user).
	self answer.
]

{ #category : #rendering }
NewPostPage >> renderContentOn: aCanvas [

	aCanvas heading: 'CuOOra'. aCanvas heading.
				"level: 2;
				with: self session user nombre. self renderLogoutButtonOn: aCanvas."
	aCanvas horizontalRule .
	aCanvas form: [ 
		aCanvas paragraph: [ aCanvas label: 'titulo: '.
							aCanvas textInput on: #title of: self].
		aCanvas paragraph: [ aCanvas label: 'descripcion: '.
							aCanvas textInput on: #desc of: self].
	 	aCanvas paragraph: [ aCanvas label: 'topicos: '.
							aCanvas textInput on: #top of: self].				
		aCanvas submitButton
				callback: [ self post ];
			with: 'Post'  ] .

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
