ModUtil.Mod.Register("CosmicEggGate")

local config = {
    Enabled = true
}
CosmicEggGate.config = config

DebugPrint({Text = "CosmicEggGate: merging table"})
ModUtil.Table.Merge(TraitData, {
    ChaosBoonTrait = {
        RemainingUses = 1,
		ForceSecretDoor = true,
    }
})
