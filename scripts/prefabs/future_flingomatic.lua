require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/future_flingomatic.zip"),
}

local prefabs = 
{
	"collapse_small",
	"firesuppressor_placer"
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	inst.components.future_flingomatic_comp:Remove()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("idle")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle")
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	   
    --MakeObstaclePhysics(inst, 1)
    
    anim:SetBank("future_flingomatic")
    anim:SetBuild("future_flingomatic")
    anim:PlayAnimation("idle")
    
	inst:AddComponent("future_flingomatic_comp")
	
    inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = function(inst)
		inst.components.future_flingomatic_comp:TogglePlacer()
		return "WORKING"
	end
	
    inst:AddComponent("lootdropper") 
    
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:ListenForEvent( "onbuilt", onbuilt)
   
    return inst
end

return Prefab( "common/future_flingomatic", fn, assets)