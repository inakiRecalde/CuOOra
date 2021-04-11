Class {
	#name : #FriendsFinderPage,
	#superclass : #WAComponent,
	#instVars : [
		'searchText'
	],
	#category : #'CuOOra-ui'
}

{ #category : #initialization }
FriendsFinderPage >> initialize [
	super initialize.
	searchText := ''
]

{ #category : #rendering }
FriendsFinderPage >> renderContentOn: aCanvas [
	self renderSearchFormOn: aCanvas.
	self renderSearchResultsOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button: 'Finish' ]
]

{ #category : #rendering }
FriendsFinderPage >> renderSearchFormOn: aCanvas [
	aCanvas
		form: [ aCanvas textInput on: #searchText of: self.
			aCanvas space.
			aCanvas submitButton with: 'Search' ]
]

{ #category : #rendering }
FriendsFinderPage >> renderSearchResultsOn: aCanvas [
	| users |
	searchText ifEmpty: [ ^ self ]. 
	users := CuOOra soleInstance usersMatchingNamePart: searchText.
	users
		ifEmpty: [ aCanvas
				paragraph: 'Sorry... no matches... no friends for you this time.' ]
		ifNotEmpty:
			[ self renderUsers: users on: aCanvas ]
]

{ #category : #rendering }
FriendsFinderPage >> renderUsers: users on: aCanvas [
	^ aCanvas
		unorderedList: [ users
				do: [ :each | 
					(self session user canBefriend: each)
						ifTrue: [ aCanvas
								listItem: [ aCanvas
										text: each nombre;
										space.
									aCanvas anchor
										callback: [ self seguirA: each ];
										with: [ aCanvas button: 'Befriend' ] ] ] ] ]
]

{ #category : #accessing }
FriendsFinderPage >> searchText [
	^ searchText
]

{ #category : #accessing }
FriendsFinderPage >> searchText: anObject [
	searchText := anObject
]

{ #category : #callbacks }
FriendsFinderPage >> seguirA: anUser [
	self session user seguirUser: anUser
]
