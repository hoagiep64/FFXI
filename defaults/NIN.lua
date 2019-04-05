--NINJA--
function refresh_NIN()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_NIN()
	elseif displaySet == 0 then -- Use Paulu's Default NIN display
		--1-- Set
		Set_Display(1)
		--2-- Shihei
		Shihei_Display(2)
		--3-- Yonin / Innin
		if BuffActive(421) then
			Ability_Display(3,147,421) -- Innin
		else
			Ability_Display(3,146,420) -- Seigan
		end
		--4-- Issekigan
		Ability_Display(4,57,484)
		--5-- Sange
		Ability_Display(5,145,352)
		--6-- Futae
		Ability_Display(6,148,441)
		--7-- Sub Jobs --
		Subjob_Display(7)
		--8-- Ammo
		Ammo_Display(8)
		--9--
		Empty(9)
		--10--
		Empty(10)
	end
end