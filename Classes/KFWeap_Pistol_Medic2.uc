class KFWeap_Pistol_Medic2 extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Pistol;
}

defaultproperties
{
	// Inventory
	InventoryGroup=IG_Secondary
	GroupPriority=25
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicPistol'
	SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'

	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshFOV=86
	MeshIronSightFOV=77
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=29.0,Y=13,Z=-4)

	//Content
	PackageKey="Medic_Pistol"
	FirstPersonMeshName="WEP_1P_Medic_Pistol_MESH.Wep_1stP_Medic_Pistol_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Medic_Pistol_ANIM.WEP_1P_Medic_Pistol_ANIM"
	PickupMeshName="wep_3p_medic_pistol_mesh.Wep_Medic_Pistol_Pickup"
	AttachmentArchetypeName="WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_3P"
	MuzzleFlashTemplateName="WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_MuzzleFlash"

	HealingDartDamageType=class'KFDT_Dart_Healing'
	DartFireSnd=(DefaultCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_1P')
	LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Locked_1P'
	LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Lost_1P'
	LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Locking_1P'
    HealImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Heal'
    HurtImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Hurt'
	OpticsUIClass=class'KFGFxWorld_MedicOptics'
	HealingDartWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Default_Recoil'

   	// Zooming/Position
	IronSightPosition=(X=15,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=15
	SpareAmmoCapacity[0]=240
	InitialSpareMags[0]=8
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=250
	minRecoilPitch=200
	maxRecoilYaw=100
	minRecoilYaw=-100
	RecoilRate=0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=250
	RecoilISMinPitchLimit=65485

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pistol9mm'
	FireInterval(DEFAULT_FIREMODE)=+0.175
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Pistol_Medic'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Pistol_Medic'
	Spread(DEFAULT_FIREMODE)=0.015
	FireOffset=(X=20,Y=4.0,Z=-3)

	// ALTFIRE_FIREMODE
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_HealingDart_MedicBase'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Dart_Toxic'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=21

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	//WeaponUpgrades[1]=(IncrementDamage=1.7f,IncrementWeight=0, IncrementHealFullRecharge=.9)
	//WeaponUpgrades[2]=(IncrementDamage=2.0f,IncrementWeight=1, IncrementHealFullRecharge=.8)
	//WeaponUpgrades[3]=(IncrementDamage=2.55f,IncrementWeight=2, IncrementHealFullRecharge=.7)
	//WeaponUpgrades[4]=(IncrementDamage=3.0f,IncrementWeight=3, IncrementHealFullRecharge=.6)

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.7f), (Stat=EWUS_HealFullRecharge, Scale=0.9f)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=2.0f), (Stat=EWUS_Weight, Add=1), (Stat=EWUS_HealFullRecharge, Scale=0.8f)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=2.55f), (Stat=EWUS_Weight, Add=2), (Stat=EWUS_HealFullRecharge, Scale=0.7f)))
	WeaponUpgrades[4]=(Stats=((Stat=EWUS_Damage0, Scale=3.0f), (Stat=EWUS_Weight, Add=3), (Stat=EWUS_HealFullRecharge, Scale=0.6f)))
	
	//Modified Stats:
	// Healing charge
    HealAmount = 15
	HealFullRechargeSeconds = 10
	// Inventory
	InventorySize=0
	bCanThrow=false
	bDropOnDeath=false
	AssociatedPerkClasses(0)=class'KFPerk_Berserker'
	AssociatedPerkClasses(1)=class'KFPerk_Commando'
	AssociatedPerkClasses(2)=class'KFPerk_Support'
	AssociatedPerkClasses(3)=class'KFPerk_FieldMedic'
	AssociatedPerkClasses(4)=class'KFPerk_Demolitionist'
	AssociatedPerkClasses(5)=class'KFPerk_Firebug'
	AssociatedPerkClasses(6)=class'KFPerk_Gunslinger'
	AssociatedPerkClasses(7)=class'KFPerk_Sharpshooter'
	AssociatedPerkClasses(8)=class'KFPerk_Survivalist'
	AssociatedPerkClasses(9)=class'KFPerk_SWAT'

	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=34.0

	// ALTFIRE_FIREMODE
	AmmoCost(ALTFIRE_FIREMODE) = 30
}

