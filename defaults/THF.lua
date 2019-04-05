--THIEF--
function refresh_THF()
	if displaySet == 1 then
		custom_THF()
		return
	elseif displaySet == 0 then
		--1-- Set
		Set_Display(1)
		--2-- Sneak Attack
		Ability_Display(2,64,65)
		--3-- Trick Attack
		Ability_Display(3,66,87)
		--4-- Feint
		Ability_Display(4,68,343)
		--5-- Assassin's Charge
		Ability_Display(5,67,342)
		--6-- Bully
		Ability_Display(6,240)
		--7-- Conspirator
		Ability_Display(7,40,462)
		--8-- Collab
		Ability_Display(8,69)
		--9-- Subjob
		Subjob_Display(9)
		--10--
		Empty(10)
		return
	end
end