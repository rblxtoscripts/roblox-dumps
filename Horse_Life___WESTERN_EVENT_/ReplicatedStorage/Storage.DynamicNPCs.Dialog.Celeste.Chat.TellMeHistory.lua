-- https://lua.expert/
return {
	Text = "Tell me about this place?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "History is a complicated subject. Some of it I would rather not revisit."
				},
				{
					Dialog = "You want to know about the world before? What remains of Aetheron is a wound. Not everything deserves to be poked at."
				},
				{
					Dialog = "Orion\'s lands are not something I discuss lightly. Ask me something else."
				},
				{
					Dialog = "The world did not shatter all at once, you know. Some places healed. Slowly, quietly, in the places no one was looking. That is where we came from."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "My people did not retreat out of fear. We retreated out of wisdom. There is a difference. We watched, we waited, and when the time was right... well. Here we are."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I saw Orion\'s lands once, from a distance. Even from far away you can tell something is deeply wrong with them. The air sits differently there."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I will tell you something few people know... the land remembers Aetheron. Not as a memory, but as a wound that keeps trying to close. This place sits on one of those spots. That is not an accident."
				}
			}
		}
	}
}