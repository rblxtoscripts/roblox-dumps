-- https://lua.expert/
return {
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Oh, a gift? How sweet of you! Thank you, I\'ll take good care of it."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "For me? That\'s so kind! You really didn\'t have to, but I\'m happy you did!"
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "You\'re always so thoughtful! This made my whole day brighter, thank you!"
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Sweet hooves! You spoil me! You\'re such a wonderful friend, I\'m so glad to know you!"
				}
			}
		}
	}
}