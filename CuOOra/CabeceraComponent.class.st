Class {
	#name : #CabeceraComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
CabeceraComponent >> findFriend [
	self call: FriendsFinderPage new.
]

{ #category : #callback }
CabeceraComponent >> perfilUser: aUser [

	(self session user == aUser)
	ifTrue: [self call: (PerfilUserComponent user: aUser)].
	self call: (PerfilVisitorComponent new user: aUser).
]

{ #category : #rendering }
CabeceraComponent >> renderBackButtonOn: aCanvas [
		aCanvas anchor 
			callback: [ self volverHome];
			with: [ aCanvas button: 'Home' ].
	aCanvas space.
	aCanvas horizontalRule
]

{ #category : #rendering }
CabeceraComponent >> renderBuscarOn: aCanvas [.
		aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Buscar Amigos' ]
]

{ #category : #rendering }
CabeceraComponent >> renderCabecera: aCanvas [
	aCanvas heading: 'CuOOra'. 
	self renderPerfilUserOn: aCanvas.
	aCanvas space.
	self renderLogoutButtonOn: aCanvas.
	aCanvas space.
	self renderBuscarOn: aCanvas.

	
]

{ #category : #rendering }
CabeceraComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self volverLogin ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
CabeceraComponent >> renderPerfilUserOn: aCanvas [.
	aCanvas anchor
			callback: [ self perfilUser: self session user];
			with: self session user nombre.
]

{ #category : #callback }
CabeceraComponent >> volver [
	self answer .
]

{ #category : #callback }
CabeceraComponent >> volverHome [
	self call: HomePage new.
]

{ #category : #callback }
CabeceraComponent >> volverLogin [
	self call: WelcomePage new.
]
