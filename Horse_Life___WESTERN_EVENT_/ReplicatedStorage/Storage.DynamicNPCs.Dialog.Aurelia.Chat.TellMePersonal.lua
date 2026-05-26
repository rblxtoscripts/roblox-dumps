-- https://lua.expert/
return {
	Text = "Tell me about yourself?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "I am a practicing warrior and mage, most profficient in ice magic."
				},
				{
					Dialog = "Sure, I\'m an Auricon, a human blended with unicorn DNA. Never saw much of my race growing up."
				},
				{
					Dialog = "I read grimoires, magical books. I also grow magic plants and make potions, not that I\'m great at it though."
				},
				{
					Dialog = "I mostly grew up in one of the great cities of Aetheron, I\'m over 200 years old so I\'ve been around since then."
				},
				{
					Dialog = "My official occupation in the past was a revered top ranking guild member. Highest class and sought out by many."
				},
				{
					Dialog = "Why would you want to know about me? I\'ll try to think of something I suppose..."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "My father was always good at potion making\226\128\166 me? Not so much."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I\'m what you would call.. forcibly stubborn, I suppose. Sometimes I find that it would be easier to admit defeat rather than to accept what I\'m looking for does not exist, to agree that blossomed donkeys mischievous spirits only belong in grimoire\'s and rumours but I look at things\226\128\166 sideways. In ways no one else does, I suppose that makes me different but I don\'t think that\'s a bad thing."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I\'d doubt you\'d be surprised to hear this but I\'m different from the rest, sometimes I wonder if my individuality is the reason for my history but the seasons have softened me somewhat, perhaps your company has to, if you are so bold as to be unapologetically yourself then maybe I too can find the pride and courage to do the same."
				}
			}
		}
	}
}