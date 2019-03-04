follow = true -- On/Off switch for /follow during the Auto() function.
followtarget = ''
autoplay = false -- On/Off switch for the Auto() function.
yourtarget = 17056472 -- Used to lock a target to memory such as a Voidwatch Rift for easy-trading.


function AutoPlay()
	if autoplay == false then
		windower.add_to_chat(158,'----- AUTO PLAY Mode: ON -----')
		autoplay = true
		send_command('gs c AUTO')
	else
		windower.add_to_chat(123,'----- AUTO PLAY Mode: OFF -----')
		autoplay = false
	end
end

-- HEALER COLLECTION --

--- Call these functions via Gearswap 'send_command()' to execute their respective checks ---
--[[Ex:
		if command == 'cure' then
			Cure()
		end
--]]


function Critical_Cure() -- Runs entire party through a Cure V/IV check.
	for i=1, party.count do
		if Critical_Cure_Check(party[i]) == 1 then
			return
		end
	end
end

function Cure() -- Runs entire party through a Cure III check.
	for i=1, party.count do
		if Cure_Check(party[i]) == 1 then
			return
		end
	end
end

function Haste(value) --Runs entire party through an Haste check.
	for i=1, party.count do
		if Haste_Check(party[i]) == 1 then
			return
		end
	end
end

function Erase() -- Runs entire party through an Erase/-Na check.
	for i=1, party.count do
		if Erase_Check(party[i]) == 1 then
			return
		end
	end
end

----

--- Backbone of the Cure/Critical_Cure/Haset/Erase functions ---
function Critical_Cure_Check(person) -- Is this Person in need of a strong cure?
	if person.mob == nil then
		return 0
	elseif person.mob.hpp < 60 and (person.mob.distance/20) < 21.04 then
		if player.main_job == 'WHM' and windower.ffxi.get_spell_recasts()[5] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Cure V" '..tostring(person.mob.name))
			return 1
		elseif windower.ffxi.get_spell_recasts()[4] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Cure IV" '..tostring(person.mob.name))
			return 1
		else
			return 0
		end
	else	
			return 0
	end
	
end

function Cure_Check(person) -- If player is below 75% Cure III them.
	if person.mob == nil then
		return 0
	elseif player.main_job == 'WHM' or player.main_job == 'RDM' or player.main_job == 'SCH' or player.sub == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'SCH' then
		if person.mob.hpp < 75 and (person.mob.distance/20) < 21.04 and windower.ffxi.get_spell_recasts()[3] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Cure III" '..tostring(person.mob.name))
			return 1
		else	
			return 0
		end
	else
		return 0
	end
end

function Haste_Check(person) -- Is this person in need of a Haste?
	if person.mob == nil or person.mob.is_npc then
		return 0
	elseif not person.buffactive[33] and (person.mob.distance/20) < 21.04 and not person.buffactive[13] and windower.ffxi.get_spell_recasts()[511] == 0 then	
		if player.main_job == 'RDM' then
			Pause_Follow()
			send_command('wait .5;input /ma "Haste II" '..tostring(person.mob.name))
			return 1
		elseif player.main_job == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'WHM' and windower.ffxi.get_spell_recasts()[57] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Haste" '..tostring(person.mob.name))
			return 1
		else
			return 0
		end
	else
		return 0
	end
end
	

	
function Erase_Check(person) -- Is this person in need of an Erase or -na spell?
	if person.mob == nil or person.mob.is_npc then
		return 0
	elseif player.main_job == 'WHM' or player.sub_job == 'WHM' or buffactive['Addendum: White'] then
		if (person.mob.distance/20) < 21.04 then    
			--- Doom/Curse ---
			if person.buffactive[15] or person.buffactive[9] then
				Pause_Follow()
				send_command('wait .5;input /ma "Cursna" '..tostring(person.mob.name))
				return 1
			--- Petrafication ---
			elseif person.buffactive[7] then
				Pause_Follow()
				send_command('wait .5;input /ma "Stona" '..tostring(person.mob.name))
				return 1
			--- Paralysis ---
			elseif person.buffactive[4] then
				Pause_Follow()
				send_command('wait .5;input /ma "Paralyna" '..tostring(person.mob.name))
				return 1
			--- Silenced ---
			elseif person.buffactive[4] then
				Pause_Follow()
				send_command('wait .5;input /ma "Silena" '..tostring(person.mob.name))
				return 1
			--- Disease/Plague ---
			elseif person.buffactive[8] or person.buffactive[31] then
				Pause_Follow()
				send_command('wait .5;input /ma "Viruna" '..tostring(person.mob.name))
				return 1
			--- Poisoned ---
			elseif person.buffactive[4] then
				Pause_Follow()
				send_command('wait .5;input /ma "Poisona" '..tostring(person.mob.name))
				return 1
			--- Blindness ---
			elseif person.buffactive[5] then
				Pause_Follow()
				send_command('wait .5;input /ma "Blindna" '..tostring(person.mob.name))
				return 1
			--- Sleep ---
			elseif person.buffactive[19] and (player.main_job == 'WHM' or player.sub_job == 'WHM') then
				print(person.mob.name..'CURAGA')
				Pause_Follow()
				send_command('wait .5;input /ma "Curaga" '..tostring(person.mob.name))
				return 1
			elseif person.buffactive[19] then
				Pause_Follow()
				send_command('wait .5;input /ma "Cure" '..tostring(person.mob.name))
				return 1
			-- Erase -- 13(slow), 12(Weight), 11(Bind), 21(Addle) 135(Bio)
			elseif person.buffactive[13] or person.buffactive[12] or person.buffactive[11] or person.buffactive[21] or person.buffactive[135] then
				Pause_Follow()
				send_command('wait .5;input /ma "Erase" '..tostring(person.mob.name))
				return 1
			else
				return 0 -- Clean bill 'O health
			end
		else
			return 0 -- Party member is out of range; Tough luck for them.
		end
	else
		return 0 -- Player is not equiped to remove debuffs.
	end
end

-- END HEALER COLLECTION -- 


-- Pause Follow -- toggles autorun momentarily so the user may stand still to cast
function Pause_Follow()
	if follow == true then
		windower.send_command('setkey numpad7 down; wait 0.2;setkey numpad7 up')
	end
end