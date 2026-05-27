-- https://lua.expert/
return {
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Oh, a new face. Hello there. I\'m Celeste, it\'s nice to meet you."
				},
				{
					Dialog = "Hi hi! I\'m Celeste. I\'m really glad you stopped by."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Hi! I\'m so happy to see you again!"
				},
				{
					Dialog = "Oh, it\'s you! Hello again,  I wonder if you\'ve crossed paths with Lyric yet. She has a gift unlike anything I\'ve ever seen."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "Oh, you\'re back! I was hoping you\'d come by. I\'ve been keeping an eye on the lands to the east lately... but let\'s not worry about that now."
				},
				{
					Dialog = "There you are! I had a feeling you\'d show up today. The horses were restless this morning, I always take that as a sign something interesting is about to happen."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Oh wonderful, you\'re here! I was just thinking about you. I had a dream last night about Orion\'s lands again. I\'ll tell you about it sometime, but not today. Today is a good day."
				},
				{
					Dialog = "Oh, you\'re here! The horses will be happy to see you, they remember you, you know. That is not something Orion\'s lands could ever say."
				}
			}
		}
	}
}