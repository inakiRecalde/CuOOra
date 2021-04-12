Class {
	#name : #ElegirTopicoComponent,
	#superclass : #HomePage,
	#instVars : [
		'topico',
		'descripcion'
	],
	#category : #'CuOOra-ui'
}

{ #category : #callback }
ElegirTopicoComponent >> crearTopico [
	self call: CrearTopicoComponent new.
	
]

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
	aCanvas submitButton 
			callback: [ self crearTopico ];
			with: 'Crear topico'.
]

{ #category : #rendering }
ElegirTopicoComponent >> renderContentOn: aCanvas [ 
	self renderCabecera: aCanvas.
	self renderVolverButtonOn: aCanvas.
	aCanvas form: [  
		self renderTopicosOn: aCanvas.
		aCanvas text: 'no le interesan ? Crea uno!!'.
		self renderButtonsOn: aCanvas. ].
]

{ #category : #rendering }
ElegirTopicoComponent >> renderTopicosOn: aCanvas [
	aCanvas text: 'Topicos disponibles'.
	aCanvas unorderedList: [ 
			CuOOra soleInstance
					topicos 
							do: [ :each |
								 aCanvas listItem: [
											aCanvas anchor 
											callback: [ self seleccionarTopico: each ];
											with: each nombre ] ]].
]

{ #category : #callback }
ElegirTopicoComponent >> seleccionarTopico: unTopico [ 
	self session user topicoDeInteres: unTopico.
	self answer.
]

{ #category : #accessing }
ElegirTopicoComponent >> topico [
	^ topico
]

{ #category : #accessing }
ElegirTopicoComponent >> topico: anObject [
	topico := anObject
]
