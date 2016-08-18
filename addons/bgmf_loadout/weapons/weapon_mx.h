// if you want randomized attachments define a new weap class and
// add it to the possible weapons of the loadout. example at bottom

class mx : weapon
{
	wepname = "arifle_MX_F";
	defmag = "30Rnd_65x39_caseless_mag";
	extradefmags = 7;
	addmags[] =
	{
		{"30Rnd_65x39_caseless_mag_Tracer",2}
	};
	optic = "optic_ACO";
};

class mxc : mx
{
	wepname = "arifle_MXC_F";
	optic = "optic_Holosight_smg";
};

class mx_3gl : mx
{
	wepname = "arifle_MX_GL_F";
	defglmag = "3Rnd_HE_Grenade_shell";
	extradefglmags = 2;
	addmags[] =
	{
		{"30Rnd_65x39_caseless_mag_Tracer",2},
		{"3Rnd_Smoke_Grenade_shell",1}
	};
};

class mx_sw : mx
{
	wepname = "arifle_MX_SW_F";
	defmag = "100Rnd_65x39_caseless_mag";
	extradefmags = 3;
	addmags[] = {{"100Rnd_65x39_caseless_mag_Tracer",1}};
};

class mxm : mx
{
	wepname = "arifle_MXM_F";
	optic = "optic_Arco";
	bipod = "bipod_01_F_snd";
};


// just like i've decided not to care about giving units a weapon from a random pool of all slots
// i've decided general randomization across all accessory slots is not priority

// rather than each accessory type being individually random
// you can give units a random set of accessories that make sense together
// e.g. red dot+laser or bipod+scope, without the possibility of bipod+laser, etc

// this is more of a pain to randomize with if it's just lots of entries for 1 accessory slot

/*

class mx_arco_bipod : mx
{
	optic = "optic_Arco";
	bipod = "bipod_01_F_snd";
};

class mx_holo : mx
{
	optic = "optic_Holosight_smg";
	muzzle = "muzzle_snds_H";
};

in loadout config definition:

class primary : mx {};
class primary : mx {};
class primary : mx_arco_bipod {};
class primary : mx_holo {};

(note that duplicates merely increase the chance of that weapon being selected
 above is 50% chance plain mx, 25% arco+bipod, 25% holo)


you can also make changes directly in the loadout config class, 
but the weapon class MUST inherit from 'primary':

class primary : mx {};
class primary : mx_arco
{
	optic = "optic_Arco";
};
class mx_arco : mx_arco_bipod 
{
	bipod = "bipod_01_F_snd";
};

*/
