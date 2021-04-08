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
	self session user
		agregarPregunta: 
			(Pregunta titulo: title descripcion:desc topicos: top , ' (' , self session user nombre, ')').
	self answer
]

{ #category : #rendering }
NewPostPage >> renderContentOn: aCanvas [

	aCanvas heading: 'CuOOra'. aCanvas heading.
				"level: 2;
				with: self session user nombre. self renderLogoutButtonOn: aCanvas."
	aCanvas horizontalRule .
	aCanvas text: 'titulo'.
	aCanvas form: [ 
		(aCanvas textArea on: #title of: self)
				columns: 80;
				rows: 1].
			aCanvas break.
aCanvas text: 'descripcion'.
			aCanvas form: [
				(aCanvas textArea on: #desc of: self)
				columns: 80;
				rows: 5].
			aCanvas break.
aCanvas text: 'topicos'.
				aCanvas form: [
					(aCanvas textArea on: #top of: self)
					columns: 80;
					rows: 1 ].
			aCanvas break.
			aCanvas submitButton
				callback: [ self post ];
				with: 'Post' .
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
