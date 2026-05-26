-- https://lua.expert/
return {
	Text = "How are you?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = { "I\'m good thanks for asking Kiddo, set on finding some rare geodes today!" }
				},
				{
					Dialog = { "Kiddo I\'m doing just great, sure could use a barbeque rack of beef ribs though!" }
				},
				{
					Dialog = { "Hoo hoo! Thanks for asking, I\'m good but my boots are so muddy! It started raining while I was in the mines." }
				},
				{
					Dialog = { "Good Kiddo, and how are you? Hope you\'re exploring the land and learning new things!" }
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = { "Hey champ! I\'m doin\' just fine. And yourself? Have you found any geologically interesting strata lately?" }
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = { "Hey sport! I found a pretty interesting crystal earlier today, so pretty great!" }
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "Well hey there pebble! Glad to see ya! I\'m doin\' mighty fine! How are you this fine day?"
				}
			}
		}
	}
}