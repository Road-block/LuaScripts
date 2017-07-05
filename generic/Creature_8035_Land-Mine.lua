--[[
    Benediction Lua Scripts
    Creature 8035 - Land Mine
    Developed by Asura
--]]

MINE = {}

function LandMine_OnSpawn(Unit)
    -- Initialize our data
    local sUnit = tostring(Unit)
    MINE[sUnit] = {}
    MINE[sUnit].Phase = 1;

    Unit:SetCanMove(false)
    Unit:SetCanEnterCombat(false)
    Unit:CreateTimer("DetonateTimer", 5000)
    Unit:SendScriptTextById(13, 3541) -- %s will be armed in 10 seconds!
end

function LandMine_AIUpdate(Unit, mapScript, timeDiff)
    Unit:UpdateTimers(timeDiff)

    if Unit:IsTimerFinished("DetonateTimer") then
        local sUnit = tostring(Unit)

        if MINE[sUnit].Phase == 1 then
            Unit:ResetTimer("DetonateTimer", 5000)
            Unit:SendScriptTextById(13, 3542) -- %s will be armed in 5 seconds!
            MINE[sUnit].Phase = 2
        elseif MINE[sUnit].Phase == 2 then
            Unit:ResetTimer("DetonateTimer", 1000) 
            Unit:SendScriptTextById(13, 3543) -- %s is now armed!!
            MINE[sUnit].Phase = 3
        elseif MINE[sUnit].Phase == 3 then
            Unit:ResetTimer("DetonateTimer", 1000)

            local target = Unit:FindClosestLivingPlayer()
            if target ~= nil and Unit:GetDistanceFromObject(target) < 5.0 then
                Unit:RemoveTimer("DetonateTimer")
                Unit:CastSpell(Unit, 4043, true)
                Unit:Despawn(250, 0)
            else
            end
        else
        end
    else
    end
end

RegisterUnitEvent(8035, 1,  "LandMine_OnSpawn")
RegisterUnitEvent(8035, 23, "LandMine_AIUpdate")