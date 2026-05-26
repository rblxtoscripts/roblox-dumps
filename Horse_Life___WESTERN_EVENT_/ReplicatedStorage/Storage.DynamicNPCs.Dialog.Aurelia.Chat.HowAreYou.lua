-- https://lua.expert/
return {
	Text = "How are you?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = { "I\'m fine kid. What was that? I look pale? No I don\'t." }
				},
				{
					Dialog = { "I\'m fine, child. What was that? I look pale? No I don\'t. Perhaps you should keep such invasive comments to yourself. " }
				},
				{
					Dialog = { "I\'m faring well, child. Took a crack at a new potion recipe and exploded my brand new desk unfortunately... " }
				},
				{
					Dialog = { "Fine, fine." }
				},
				{
					Dialog = { "All\'s fine kid, I\'m setting out today to heal injured horses." }
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = { "I\'m doing alright. Your curiosity for such trivial things reminds me of myself little one, you be careful now child or I might end up taking a liking to you." }
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = { "Well if I must be honest, I\'m in quite the conundrum as of this moment. Perhaps you could offer some help? Would you prefer being called little ice cube? Perhaps blizzard or snowstorm would suite you better considering how you appeared out of thin air, although I also see your similarities to snowflakes and icicles.. I\'m sure I\'ll land on a decision soon enough." }
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Just conducting research, snowflake. Honestly it\'s all rather mundane, I doubt you\'d find any interest in it. You see, I\'m the kind of person who writes down everything so I won\'t forget but end up writing so many notes that there\'s no way of remembering where I put them. The new notes just pile up onto of old notes, never to be read again."
				}
			}
		}
	}
}