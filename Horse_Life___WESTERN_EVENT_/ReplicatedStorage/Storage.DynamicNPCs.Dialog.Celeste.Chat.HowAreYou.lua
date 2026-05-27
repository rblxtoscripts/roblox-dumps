-- https://lua.expert/
local v0 = "Better than most days, honestly. Something about today feels familiar in a way I can\'t quite place. I\'ve learned to appreciate those days when they come."
return {
	Text = "How are you?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = { "There is always something that needs tending to here. The grounds, the horses, the training... time does not wait for anyone. Trust me on that." }
				},
				{
					Dialog = { "Fine. I simply have a great deal on my mind today. I did not sleep well \226\128\148 the dreams were loud last night." }
				},
				{
					Dialog = { v0 }
				},
				{
					Dialog = { "The horses were restless last night. When they are unsettled I tend to be as well. It is hard to explain." }
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = { "I slept better last night... the dreams were quieter than usual. I take that as a good sign, even if I am not entirely sure what it means yet" }
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = { v0 }
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Ha \226\128\148 genuinely good, which surprises even me. Something about today feels... right. Like the world is running exactly as it should. I don\'t question those days. I simply enjoy them."
				}
			}
		}
	}
}