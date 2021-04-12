Class {
	#name : #CabeceraComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
CabeceraComponent >> renderBackButtonOn: aCanvas [
	aCanvas space.
	aCanvas anchor
		callback: [ self volver ];
		with: [ aCanvas button: 'Volver' ].
	aCanvas space.
	aCanvas horizontalRule
]

{ #category : #rendering }
CabeceraComponent >> renderCabecera: aCanvas [
	aCanvas heading: 'CuOOra'. 
	self renderPerfilUserOn: aCanvas.
	aCanvas space.
	self renderLogoutButtonOn: aCanvas.

	
]

{ #category : #rendering }
CabeceraComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
CabeceraComponent >> renderPerfilUserOn: aCanvas [.
	aCanvas anchor
			callback: [ self perfilUser: self session user];
			with: self session user nombre.
]

{ #category : #'as yet unclassified' }
CabeceraComponent >> volver [
	self answer .
]
