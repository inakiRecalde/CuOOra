Class {
	#name : #FriendsFinderComponent,
	#superclass : #CabeceraComponent,
	#instVars : [
		'searchText'
	],
	#category : #'CuOOra-ui'
}

{ #category : #initialization }
FriendsFinderComponent >> initialize [
	super initialize.
	searchText := ''
]

{ #category : #rendering }
FriendsFinderComponent >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas.
	aCanvas horizontalRule.
	self renderbuttonsOn: aCanvas.
	self renderSearchFormOn: aCanvas.
	self renderSearchResultsOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button: 'Finalizar' ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderSearchFormOn: aCanvas [
	aCanvas
		form: [ aCanvas textInput on: #searchText of: self.
			aCanvas space.
			aCanvas submitButton with: 'Buscar' ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderSearchResultsOn: aCanvas [
	| users |
	searchText ifEmpty: [ ^ self ]. 
	users := CuOOra soleInstance usersMatchingNamePart: searchText.
	users
		ifEmpty: [ aCanvas
				paragraph: 'Disculpa, no hemos podido encontrar ningun usuario con ese nombre.' ]
		ifNotEmpty:
			[ self renderUsers: users on: aCanvas ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderUsers: users on: aCanvas [
	^ aCanvas
		unorderedList: [ users
				do: [ :each | 
					aCanvas
						listItem: [ aCanvas anchor
								callback: [ self perfilUser: each  ];
								with: each nombre.
							(self session user canBefriend: each)
								ifTrue: [ aCanvas anchor
										callback: [ self seguirA: each ];
										with: [ aCanvas button: 'Seguir' ] ] ] ] ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderbuttonsOn: aCanvas [
	aCanvas anchor 
			callback: [ self answer];
			with: [ aCanvas button: 'volver' ].
			
		aCanvas anchor 
			callback: [ self volverHome];
			with: [ aCanvas button: 'Home' ].
]

{ #category : #accessing }
FriendsFinderComponent >> searchText [
	^ searchText
]

{ #category : #accessing }
FriendsFinderComponent >> searchText: anObject [
	searchText := anObject
]

{ #category : #callbacks }
FriendsFinderComponent >> seguirA: anUser [
	self session user seguirUser: anUser
]
