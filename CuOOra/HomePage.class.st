Class {
	#name : #HomePage,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
HomePage >> createNewPost [
	self call: NewPostPage new.
]

{ #category : #callback }
HomePage >> elegirTopico [
	self call: ElegirTopicoComponent new.
]

{ #category : #callback }
HomePage >> findFriend [
	self call: FriendsFinderPage new.
]

{ #category : #accessing }
HomePage >> model [
	^ CuOOra soleInstance
]

{ #category : #callback }
HomePage >> perfilUser [
	self call: PerfilUserComponent new.
]

{ #category : #rendering }
HomePage >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome to CuOOra'. 
	aCanvas anchor
			callback: [ self perfilUser];
			with: self session user nombre.
	self renderLogoutButtonOn: aCanvas.
	aCanvas horizontalRule.
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	self renderFriendsOn: aCanvas.
	aCanvas horizontalRule .
	self renderTopicoInteresOn: aCanvas.
	aCanvas horizontalRule .
	aCanvas text: 'Registro de usuarios'.
	aCanvas unorderedList: [ self model usuarios do:[:each | aCanvas listItem: each nombre] ] .
		aCanvas text: 'topicos'.
	aCanvas unorderedList: [ self model topicos do:[:each | aCanvas listItem: each nombre] ] .
]

{ #category : #rendering }
HomePage >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user follows do: [ :each | aCanvas listItem: each nombre ] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Find friends' ]
]

{ #category : #rendering }
HomePage >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
HomePage >> renderPostsOn: canvas [
	canvas heading
			level: 2;
			with: 'Ultimas Preguntas'.
	canvas 
			unorderedList: [ 
				( self session model preguntasRelevantes: self session user )
				do: [ :each |  (canvas anchor 
										callback:[];
										with: each titulo) ]].
	canvas anchor 
			callback: [ self createNewPost ];
			with: [ canvas button: 'New post' ].
]

{ #category : #rendering }
HomePage >> renderTopicoInteresOn: aCanvas [
		aCanvas 
			paragraph:  [ aCanvas anchor
							callback: [ self elegirTopico ];
							with: [aCanvas button with: 'Elegir Topico de Interes' . ]]	
]
