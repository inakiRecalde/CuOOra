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
HomePage >> findFriend [
	self call: FriendsFinderPage new.
]

{ #category : #rendering }
HomePage >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome to CuOOra'. aCanvas heading
				level: 2;
				with: self session user nombre. self renderLogoutButtonOn: aCanvas.
	aCanvas horizontalRule.
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	self renderFriendsOn: aCanvas.
]

{ #category : #rendering }
HomePage >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user follows do: [ :each | aCanvas listItem: each name ] ].
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
			unorderedList: [ ( CuOOra soleInstance preguntasRelevantesDeUsuario: self session user )
					do: [ :each | canvas listItem: each titulo & (each descripcion) ]].
	canvas anchor 
			callback: [ self createNewPost ];
			with: [ canvas button: 'New post' ].
]
