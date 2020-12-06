AddCSLuaFile()

SWEP.Author                 =   "Minity"
SWEP.Base                   =   "weapon_base"
SWEP.PrintName              =   "Auto-Pistol"
SWEP.Instructions           =   [[Left-Click: Automatic fire.]]
SWEP.ViewModel              =   "models/weapons/c_pistol.mdl"
SWEP.ViewModelFlip          =   false
SWEP.UseHands               =   true
SWEP.WorldModel             =   "models/weapons/c_pistol.mdl"
SWEP.SetHoldType            =   "pistol"
SWEP.Weight                 =   5

SWEP.AutoSwitchTo           =   true
SWEP.AutoSwitchFrom         =   false

SWEP.Slot                   =   1 
SWEP.SlotPos                =   0

SWEP.DrawAmmo               =   false
SWEP.DrawCrosshair          =   true

SWEP.Spawnable              =   true
SWEP.AdminSpawnable         =   true

SWEP.Primary.ClipSize       =   27
SWEP.Primary.DefaultClip    =   27
SWEP.Primary.Ammo           =   "pistol"
SWEP.Primary.Automatic      =   "true"
SWEP.Primary.Recoil         =   0
SWEP.Primary.Damage         =   8
SWEP.Primary.NumShots       =   1
SWEP.Primary.Spread         =   0.05
SWEP.Primary.Cone           =   0
SWEP.Primary.Delay          =   0.18

SWEP.Secondary.ClipSize     =   -1
SWEP.Secondary.DefaultClip  =   -1
SWEP.Secondary.Ammo         =   "none"
SWEP.Secondary.Automatic    =   false

SWEP.ShouldDropOnDie        =   false

local ShootSound = Sound("Weapon_Pistol.Single")
local ReloadSound = Sound("Weapon_Pistol.Reload")

function SWEP:Initialize()
    self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()

    if(not self:CanPrimaryAttack()) then
        return
    end

    local ply = self:GetOwner()

    ply:LagCompensation(true)

    local Bullet = {}
        Bullet.Num          =   self.Primary.NumShots
        Bullet.Src          =   ply:GetShootPos()
        Bullet.Dir          =   ply:GetAimVector()
        Bullet.Spread       =   Vector(self.Primary.Spread, self.Primary.Spread, 0)
        Bullet.Tracer       =   0
        Bullet.Damage       =   self.Primary.Damage
        Bullet.AmmoType     =   self.Primary.Ammo

    self:FireBullets(Bullet)
    self:ShootEffects()

    self:EmitSound(ShootSound)
    self.BaseClass.ShootEffects(self)
    self:TakePrimaryAmmo(1)
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)


    ply:LagCompensation(false)

end

function SWEP:CanSecondaryAttack()
    return false
end

function SWEP:Reload()
    if self.ReloadingTime and CurTime() <= self.ReloadingTime then return end
 
	if ( self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
 
		self:DefaultReload( ACT_VM_RELOAD )
                local AnimationTime = self.Owner:GetViewModel():SequenceDuration()
                self.ReloadingTime = CurTime() + AnimationTime
                self:SetNextPrimaryFire(CurTime() + AnimationTime)
                self:SetNextSecondaryFire(CurTime() + AnimationTime)
                self:EmitSound(ReloadSound)
	end
end