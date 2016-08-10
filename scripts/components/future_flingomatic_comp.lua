local future_flingomatic_comp = Class(function(self, inst)
	self.inst = inst
	self.placer = nil
end)

function future_flingomatic_comp:TogglePlacer()
	if self.placer == nil then
		self.placer = SpawnPrefab("firesuppressor_placer")
		self.placer.Transform:SetPosition(self.inst.Transform:GetWorldPosition())
	else
		self.placer:Remove()
		self.placer = nil
	end
end

function future_flingomatic_comp:Remove()
	if self.placer ~= nil then
		self.placer:Remove()
		self.placer = nil
	end
end

return future_flingomatic_comp