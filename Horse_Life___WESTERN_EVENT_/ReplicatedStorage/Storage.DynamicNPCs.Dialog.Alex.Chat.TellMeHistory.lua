-- https://lua.expert/
return {
	Text = "Tell me about this place?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Oh sure thing! We are in Aetheron, a world turned fractured. Luckily none of the fire burning apocalypse nightmare stuff, grass for miles and sunny days it is."
				},
				{
					Dialog = "Aetheron is not only a place rich with culture, good food, people, and horses, but a place with incomprehensible magical geographical makeup. Before there was even floating islands."
				},
				{
					Dialog = "The geosphere of Aetheron is like no other, bountifully rich soils, crystals, and stones upheld our magical society believe it or not."
				},
				{
					Dialog = "Since the fracturing event occured, it\'s pretty difficult for me to find new caves to set up in, I\'m sure I\'ll find a bountiful one soon."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Did you know that fire can consume even the most resilient magical items?"
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I\'m trying my best find any remaining sources of magical energy, but it\'s hard sometimes."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I think I\'m pretty close to finding out what happened, pebble. Maybe there was a bit of that fire burning apocalypse stuff after all."
				},
				{
					Dialog = "Let me tell you about when our mining village came up with the idea for us to go in pairs with gargoyles to the mines! We used to go in alone, you see. Not very smart, I know. The gargoyles in our village did the same, cause we didn\'t know how much we needed each other back then. There was some glory in finding a rare gem by yourself, or something.",
					Choices = {
						{
							Text = "Yes, going in a dark, scary, confusing mines alone is a bad idea...",
							Dialog = "Haha, yes, pebble. Anyway, our founder, Alexandria (Did you know I\'m named after her? What an honor!) went into her favorite mine one day. She got lost in the twisting, damp, dark, scary mine tunnels for days. They sent search party after search party after her, but it was finally a lone gargoyle that found her!",
							"They worked together to find their way back out. With Alexandria\'s ability to use her human hands and solve the puzzles scattered throughout the mine and the gargoyle\'s magical pathfinding abilities, they got through it! Ever since, we\'ve worked together in pairs in the mines."
						}
					}
				}
			}
		}
	}
}