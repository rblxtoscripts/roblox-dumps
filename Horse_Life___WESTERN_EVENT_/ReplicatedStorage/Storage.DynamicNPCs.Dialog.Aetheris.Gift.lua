-- https://lua.expert/
return {
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Hey there! You want this..?"
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Hey there traveler! I found something for you."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "TRAVELER! I\'m so glad you stopped by, I found this amazing thing for you!!"
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Hi traveler! Thanks for stopping by, I found this on my travels today, think you can take care of it?! Thanks!!"
				}
			}
		}
	}
}