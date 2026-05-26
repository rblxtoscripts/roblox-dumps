-- https://lua.expert/
return {
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Hey I got something here for ya kiddo, hope it helps you in your adventures"
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Hey kiddo! I gotcha something, hope you like it."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "Kiddo! Good to see you, I got something for ya."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Good seeing ya today kiddo. Hope your travels are on the up and up, I got a present for ya!"
				}
			}
		}
	}
}