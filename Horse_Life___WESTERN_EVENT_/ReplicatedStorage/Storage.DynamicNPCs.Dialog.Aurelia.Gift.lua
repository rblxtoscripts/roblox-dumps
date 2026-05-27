-- https://lua.expert/
return {
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "This is for you...I guess."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Here\'s something for you I suppose."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I may have gathered this for you, please treat it with respect."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Welcome welcome, I\'ve got a present for you. I do hope you\'ll treasure it dearly."
				}
			}
		}
	}
}