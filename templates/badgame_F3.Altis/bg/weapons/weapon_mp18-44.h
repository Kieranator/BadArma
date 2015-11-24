class mp18 : weapon
{
	wepname = "lib_Mp18";
	defmag = "lib_32Rnd_9x19_MP18";
	extradefmags = 7;
};

class mp28 : mp18
{
	wepname = "lib_Mp28";
	defmag = "lib_32Rnd_9x19_MP28";
};

class mp35 : mp18
{
	wepname = "lib_Mp35";
	defmag = "lib_32Rnd_9x19_MP35";
};

class mp38 : mp18
{
	wepname = "lib_Mp38";
	defmag = "lib_32Rnd_9x19";
};

class mp40 : mp38
{
	wepname = "LIB_MP40";
};

class mp41 : mp38
{
	wepname = "Lib_Mp41r";
};

class mp44 : mp18
{
	wepname = "LIB_MP44";
	defmag = "lib_30Rnd_792x33";
};

class mp44gl : mp44
{
	wepname = "LIB_MP44gg";
	defglmag = "lib_1Rnd_30mm_GPzgr";
	extradefglmags = 4;
};