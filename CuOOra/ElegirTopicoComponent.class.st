Class {
	#name : #ElegirTopicoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'topico',
		'descripcion'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
ElegirTopicoComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
ElegirTopicoComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #rendering }
ElegirTopicoComponent >> renderButtonsOn:  aCanvas [
		|newTopic|
		newTopic := Topico nombre: topico descripcion: descripcion . 
		aCanvas submitButton
		callback: [ CuOOra soleInstance elegirTopicoInteres: self session user topico: newTopic ];
		with: 'Crear topico'.
]

{ #category : #rendering }
ElegirTopicoComponent >> renderContentOn: aCanvas [
	aCanvas  form: [  
		self renderTopicosOn: aCanvas.
		self renderInputElementOn: aCanvas.
		self renderButtonsOn: aCanvas.
		self answer. ]
]

{ #category : #rendering }
ElegirTopicoComponent >> renderInputElementOn: aCanvas [
	aCanvas label: 'Crear Topico'.
	aCanvas paragraph: [ aCanvas textInput on: #topico of: self ].
	aCanvas label: 'Descripcion del topico'.
	aCanvas paragraph: [ aCanvas textInput on: #descripcion of: self ].
]

{ #category : #rendering }
ElegirTopicoComponent >> renderTopicosOn: aCanvas [
	aCanvas text: 'Topicos disponibles'.
	aCanvas unorderedList: [ 
			CuOOra soleInstance
					topicos 
							do: [ 
								:each | 
										aCanvas listItem: [ aCanvas anchor 
													callback: [ self seleccionarTopico: each ];
													with: each nombre ] ] ] .
]

{ #category : #callback }
ElegirTopicoComponent >> seleccionarTopico: unTopico [ 
	self session user elegirTopico: unTopico.
]

{ #category : #accessing }
ElegirTopicoComponent >> topico [
	^ topico
]

{ #category : #accessing }
ElegirTopicoComponent >> topico: anObject [
	topico := anObject
]
