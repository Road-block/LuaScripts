--[[
    Jadefire Lua Scripts
    Quest 4726 - Broodling Essence
    Developed by Asura
--]]

-- ToDo: 16007 has -1 for duration. Maybe we should make an AI Update event to clear it.

WHELP = {}

function Whelp_OnSpawn(Unit)
    local sUnit = tostring(Unit)
    WHELP[sUnit] = {}
    WHELP[sUnit].Flagged = false;
end

function Whelp_OnDeath(Unit, Killer)
    local sUnit = tostring(Unit)
    if WHELP[sUnit].Flagged == 1 then
        Unit:CastSpell(Unit, 16027, true)
        WHELP[sUnit].Flagged = 0
    else
    end
end

function Whelp_OnSpellTaken(Unit, Attacker, Spell)
    if Unit:GetAuraById(16007) then
    end -- We have the aura. No reason to do this again.

    if Spell:GetSpellId() == 16007 then
        Unit:AddAura(16007) -- Make it look pretty, visually.
        local sUnit = tostring(Unit)
        WHELP[sUnit].Flagged = 1;
    else
    end
end

function Essence_OnInitialize(Gobject)
    Gobject:SetState(1) -- Allows it to be looted.
     -- Should this be linked to the specific player?
end

-- Black Broodling
RegisterUnitEvent(7047, 1,  "Whelp_OnSpawn")
RegisterUnitEvent(7047, 2,  "Whelp_OnDeath")
RegisterUnitEvent(7047, 11, "Whelp_OnSpellTaken")

-- Scalding Broodling
RegisterUnitEvent(7048, 1,  "Whelp_OnSpawn")
RegisterUnitEvent(7048, 2,  "Whelp_OnDeath")
RegisterUnitEvent(7048, 11, "Whelp_OnSpellTaken")

-- Flamescale Broodling
RegisterUnitEvent(7049, 1,  "Whelp_OnSpawn")
RegisterUnitEvent(7049, 2,  "Whelp_OnDeath")
RegisterUnitEvent(7049, 11, "Whelp_OnSpellTaken")

-- Broodling Essence Gobject
RegisterGameObjectEvent(175264, 1, "Essence_OnInitialize")
