--[[
    Jadefire Lua Scripts
    Quest 9364 - Fragmented Magic
    Developed by Asura
--]]

-- Handles the specific nagas being hit by Polymorph spells 
function Naga_OnSpellTaken(Unit, Attacker, Spell)
    if Spell:HasMechanic(17) then -- Has Mage Polymorph Mechanic
        if Attacker:IsPlayer() then
            if Attacker:HasQuest(9364) then
                Unit:Despawn(3000, 60000)   -- Set Despawn timer
            else
            end
        else
        end
    else
    end
end

function Naga_OnDestruction(Unit)
    Unit:CastSpell(Unit, 28406, false)      -- Cast our backfire spell
    Unit:ResetMovement()                    -- 28406 has a Fear aura applied with it. Blizzard doesn't show this. This fixes it.
    Unit:EnterEvadeMode()                   -- Ensure we despawn without issues.
end

function Clone_Spawn(Unit)
    Unit:SetRandomMovementSpeed(20.0)       -- Up our movement speed
    Unit:PushRandomMovement(10.0);          -- 10 yard spread from spawn
    Unit:Despawn(45000, 0)                  -- Despawn within a minute
end

RegisterUnitEvent(6190, 11, "Naga_OnSpellTaken")
RegisterUnitEvent(6193, 11, "Naga_OnSpellTaken")
RegisterUnitEvent(6194, 11, "Naga_OnSpellTaken")
RegisterUnitEvent(6195, 11, "Naga_OnSpellTaken")

RegisterUnitEvent(6190, 24, "Naga_OnDestruction")
RegisterUnitEvent(6193, 24, "Naga_OnDestruction")
RegisterUnitEvent(6194, 24, "Naga_OnDestruction")
RegisterUnitEvent(6195, 24, "Naga_OnDestruction")

RegisterUnitEvent(16479, 1,  "Clone_Spawn")