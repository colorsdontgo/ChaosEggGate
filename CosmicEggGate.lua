ModUtil.Mod.Register("CosmicEggGate")

local config = {
    Enabled = true,
    CreatedGate = false
}
CosmicEggGate.config = config

DebugPrint({Text = "CosmicEggGate: Adding setup function"})

TraitData.ChaosBoonTrait.SetupFunction = {
    Name = "CosmicEggGateSetup"
}

function CosmicEggGateSetup()
    local secretPointIds = GetIdsByType({ Name = "SecretPoint" })
    if CurrentRun ~= nil and CurrentRun.CurrentRoom ~= nil then
        if not IsEmpty( secretPointIds ) and IsGameStateEligible( CurrentRun, CurrentRun.CurrentRoom.SecretDoorRequirements ) and not config.CreatedGate then
            DebugPrint({ Text = "CosmicEggGate: forcing a secret door" })
            config.CreatedGate = true
            CurrentRun.CurrentRoom.ForceSecretDoor = true
        end
    end
end

OnAnyLoad{ "RoomPreRun",
    function( triggerArgs )
        if config.CreatedGate then
            config.CreatedGate = false
        end
    end
}