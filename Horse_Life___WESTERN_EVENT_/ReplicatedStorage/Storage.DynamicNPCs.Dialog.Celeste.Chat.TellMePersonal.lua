-- https://lua.expert/
return {
	Text = "Tell me about yourself?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "I am not particularly fond of personal questions. I find they lead somewhere neither of us is ready to go."
				},
				{
					Dialog = "Where I come from is not a place I can point to on any map you have seen. Leave it at that."
				},
				{
					Dialog = "I know what you\'re going to ask. And no \226\128\148 I won\'t tell you how old I am. It is not a polite question, and the answer would only confuse you."
				},
				{
					Dialog = "I come from one of the places where the land healed itself after everything fell apart. Quiet. Hidden. We preferred it that way for a long time."
				},
				{
					Dialog = "This place is my home now. The stable, the house... I built it all with that intention. I did not want a temporary stop... I wanted roots."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "The dreams started before I left. Places I had never been, people I had not yet met. I learned to pay attention to them. They have not led me wrong so far."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I chose this place deliberately. There is something in the land here... something still trying to mend. I wanted to be near that. To help it along if I could."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I\'ll tell you something, since you asked so genuinely. There are moments when time feels... different to me. Slower. Like the world is holding its breath and I am the only one who notices. "
				}
			}
		}
	}
}