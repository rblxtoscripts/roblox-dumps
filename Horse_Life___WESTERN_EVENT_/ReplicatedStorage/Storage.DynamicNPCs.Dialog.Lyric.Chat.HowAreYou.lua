-- https://lua.expert/
return {
	Text = "How are you?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Hey! I\'ve just finished helping a horse settle down."
				},
				{
					Dialog = "It\'s nice when it\'s quiet because then the horses relax."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "I\'m good! You picked a nice time to stop by."
				},
				{
					Dialog = "Friends have been helping out today, so it\'s been a good day!"
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I\'m feeling awesome! The horses seem more relaxed lately. Everything is great!"
				},
				{
					Dialog = "It\'s a nice day, isn\'t it? Aliya was with the horses earlier and she said they are doing well."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I\'m really great! You and my friends make this place shine."
				},
				{
					Dialog = "Amazing! Helping horses with friends feels perfect!"
				}
			}
		}
	}
}