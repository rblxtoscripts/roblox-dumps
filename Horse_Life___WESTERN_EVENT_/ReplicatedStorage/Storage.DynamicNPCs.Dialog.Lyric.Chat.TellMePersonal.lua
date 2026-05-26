-- https://lua.expert/
return {
	Text = "Tell me about yourself?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "I like helping horses."
				},
				{
					Dialog = "Taking care of horses makes me feel good."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Autumn is so funny! She cracks me up!"
				},
				{
					Dialog = "I like checking in on the horses throughout the day!"
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "Aliya helps me think about things in different ways. She\'s so smart!"
				},
				{
					Dialog = "Seeing horses relax makes me really happy. It\'s so chill!"
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I feel so happy when I know that the horses are happy!"
				},
				{
					Dialog = "My besties make me feel like I can do anything!"
				}
			}
		}
	}
}