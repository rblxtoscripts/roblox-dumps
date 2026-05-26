-- https://lua.expert/
return {
	Text = "Tell me about this place?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "This place has grown a lot since the event started."
				},
				{
					Dialog = "Look at all the horses! So much love!"
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Aliya is great at keeping people organized! I don\'t know what would happen to this place without her!"
				},
				{
					Dialog = "Paisley is so cool, calm and collected! Just looking at her calms me down!"
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "The more time you spend with horses the more they trust you."
				},
				{
					Dialog = "Kindness is the most important thing. Nova told me that."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "This place works because we all really care about it."
				},
				{
					Dialog = "Taking care of horses side by side brought us closer."
				}
			}
		}
	}
}