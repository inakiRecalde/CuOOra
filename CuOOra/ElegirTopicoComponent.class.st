Class {
	#name : #ElegirTopicoComponent,
	#superclass : #CrearTopicoComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
ElegirTopicoComponent >> crearTopico [
	self call: CrearTopicoComponent new.
	
]

{ #category : #rendering }
ElegirTopicoComponent >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas.
	self renderBackButtonOn: aCanvas.
	aCanvas
		form: [ self renderTopicosOn: aCanvas.
			aCanvas text: 'No le interesan ? Crea uno!'.
			self renderButtonOn: aCanvas ]
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
