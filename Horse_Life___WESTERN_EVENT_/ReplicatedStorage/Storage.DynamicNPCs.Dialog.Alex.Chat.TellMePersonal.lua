-- https://lua.expert/
return {
	Text = "Tell me about yourself?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Sure kiddo, I used to live in a mining village! I was the lead manager, we mined all sorts of precious gems and ores."
				},
				{
					Dialog = "Any day kiddo, my hobbies consist of mining, cooking, and cartography! I\'m not the best artist though haha."
				},
				{
					Dialog = "Well... I was quite the troublemaker myself growing up! Always making mudcakes and dragging mud in the house! I was so messy."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "I used to be part of the king\'s guild! S class!"
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I used to have a real good gargoyle friend. I miss them a lot."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Sure, pebble. My partner and I adopted two kids! One of them is still out there somewhere."
				},
				{
					Dialog = "Let me tell you about the time I was in a far-off mine, searching for the Celestial Brewstone, an artifact that brews perfect coffee, no matter who uses it!",
					Choices = {
						{
							Text = "Wow, that sounds amazing! What happened?",
							Dialog = "I had packed for a month worth of a trip, the cave was located in Aetherwood forest which was days out from my mining village. The mine was treacherous\226\128\148muddy, dark, and the air smelled like the strongest dirt-mixed espresso.",
							"Delta, my gargoyle partner, was in heaven! His rocky hide was so caked in mud it took weeks to clean him up! Every break we took he would help himself to mudbaths."
						},
						{
							Text = "Wait! Did you find the brewstone?",
							Dialog = "After days of exploring the caverns and collecting a few other curious artifacts, we found a unique room. The air was warm, filled with the irresistible scent of freshly brewed coffee, pulling me in.",
							"The Brewstone sat atop an altar made of coffee-colored stone, glowing softly and steaming. Delta and I moved cautiously for there are often traps in places like this! As we got closer, the floor became slick and slippery.",
							"With Delta using his magic to keep us steady, I reached out and firmly grasped the Brewstone. We got it! I couldn\'t wait to brew the perfect cup of coffee in the world."
						}
					}
				},
				{
					Dialog = "Delta, my partner in crime, was the best companion I could ask for. In my village, gargoyles and humans are paired up after passing their mining studies to begin their journeys together.",
					"Gargoyles have an exceptional understanding of mines. They navigate them skillfully, withstand harsh conditions, and possess light magic that\226\128\153s useful for exploring the depths.",
					"To be frank, they serve as our guardians, and having someone to chat with makes the journey even better. Plus their diet consists of dirt, mosses, and delicious crunchy crystals!",
					"Where gargoyles may lack mystical magic and puzzle-solving skills, their human companions can make up for it.",
					Choices = {
						{
							Text = "So gargoyles were super resourceful! That sounds so cool.",
							Dialog = "I graduated at the top of my class! I\226\128\153ve always had a special knack for mining; it just comes naturally to me. Because of this, I was paired with the highest-ranking gargoyle, Delta.",
							"At first, Delta was quite arrogant! He always thought he knew better than I did, which often got us caught in cavern traps and pitfalls. It took a long time for us to get along.",
							"However, he eventually became my best friend after we endured a treacherous journey together. I saved his life that day, and from then on, we became the best of buds.",
							"I hope he thinks I am doing the right thing now."
						}
					}
				}
			}
		}
	}
}