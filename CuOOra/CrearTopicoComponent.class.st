Class {
	#name : #CrearTopicoComponent,
	#superclass : #HomePage,
	#instVars : [
		'topico',
		'descripcion'
	],
	#category : #'CuOOra-ui'
}

{ #category : #callback }
CrearTopicoComponent >> crearTopico [ 
	|topic|
	topico| descripcion ifEmpty: [ ^self ].
	topic:= Topico nombre: topico descripcion: descripcion .
	CuOOra soleInstance agregarTopico: topic.
	self answer .
]

{ #category : #accessing }
CrearTopicoComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CrearTopicoComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #rendering }
CrearTopicoComponent >> renderButtonOn: aCanvas [
		aCanvas submitButton 
			callback: [ self crearTopico ];
			with: 'Crear topico'.
]

{ #category : #rendering }
CrearTopicoComponent >> renderContentOn: aCanvas [
		aCanvas form: [  
			self renderInputElementOn: aCanvas.
			self renderButtonOn: aCanvas.].
]

{ #category : #rendering }
CrearTopicoComponent >> renderInputElementOn: aCanvas [
	aCanvas label: 'Crear Topico'.
	aCanvas paragraph: [ aCanvas textInput on: #topico of: self ].
	aCanvas label: 'Descripcion del topico'.
	aCanvas paragraph: [ aCanvas textInput on: #descripcion of: self ].
]

{ #category : #accessing }
CrearTopicoComponent >> topico [
	^ topico
]

{ #category : #accessing }
CrearTopicoComponent >> topico: anObject [
	topico := anObject
]
