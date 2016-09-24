--[[
    Jadefire Lua Scripts
    Quest 2520 - Sathrah's Sacrifice
    Developed by Roadblock
--]]

--/*** SETUP ***/--
-- UUID4 to scope our functions and variables under so we avoid collisions, regen for each script
uuid62f58ad748a84231bc15b6d7de89f078 = {} 
-- friendly name reference for function,variable declarations
local guid = uuid62f58ad748a84231bc15b6d7de89f078
--/*** END SETUP ***/--

--/*** MODULE CODE ***/--
guid.OnSpawn = function(Unit)
  -- Note: a way to create custom waypoints and use :PushWaypointMovement would be nice
  -- until then, hackish way with a repeating timer.
  guid = {}
  guid.points = {}
  guid.update = 2000
  guid.despawn = 15000
  -- map a path with the player character using .gps at each intended point
  -- insert points in reverse order since table.remove by default works high to low array index
  -- it is also slightly more performant since it doesn't cause index shuffling
  table.insert(guid.points,{9644.415039,2522.200928,1331.671143,4.634644,false,false,false,false})
  table.insert(guid.points,{9638.921875,2532.241455,1331.610474,5.855931,false,false,false,false})
  table.insert(guid.points,{9630.022461,2531.942871,1331.402954,0.672299,false,false,false,false})
  table.insert(guid.points,{9623.474609,2525.843262,1331.635376,1.757715,false,false,false,false})
  table.insert(guid.points,{9629.181641,2515.711426,1331.625977,2.849418,false,false,false,false})
  table.insert(guid.points,{9639.617188,2517.801270,1331.534058,4.164962,false,false,false,false})  
  -- initialize a (repeating) timer
  Unit:CreateTimer("Step",guid.update)
  Unit:Despawn(guid.despawn,0)
end
guid.AIUpdate = function(Unit, mapScript, timeDiff)
  Unit:UpdateTimers(timeDiff)
  if Unit:IsTimerFinished("Step") then
    Unit:ResetTimer("Step",guid.update)
    local point = table.remove(guid.points)
    if point then
      Unit:MoveToLocation(table.unpack(point))
    else
      Unit:RemoveTimer("Step")
    end
  end
end
guid.OnDespawn = function(Unit) -- cleanup
  Unit:RemoveTimer("Step")
  guid = {}
end
-- we need to refer by the original here since we can't use x[var] notation for the 3rd arg
RegisterUnitEvent(7411,1,"uuid62f58ad748a84231bc15b6d7de89f078.OnSpawn") 
RegisterUnitEvent(7411,23, "uuid62f58ad748a84231bc15b6d7de89f078.AIUpdate")
RegisterUnitEvent(7411,2,"uuid62f58ad748a84231bc15b6d7de89f078.OnDespawn")
--/*** END MODULE CODE ***/--