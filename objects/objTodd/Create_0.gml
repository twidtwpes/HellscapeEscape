// Movement vars
x_speed_ = 0;
y_speed_ = 0;
max_speed_ = 2;
acceleration_ = .5;

// Controller vars
controller = 0;
hascontrol = true;
gunangle = 0;

// Effect vars
firingdelay = 0;
recoil = 0;

//Gun Array
guns[REVOLVER, RECOILSTART] = 0;
guns[REVOLVER, FIRINGDELAYSTART] = -5;
guns[REVOLVER, YOFFSET] = -7;
guns[REVOLVER, XOFFSET] = 1;
guns[REVOLVER, BOFFSET] = 20;
guns[REVOLVER, BANGLEOFFSET] = 40;
guns[REVOLVER, SPREAD] = 3;
guns[REVOLVER, BSPEED] = 25;
guns[MACHINEGUN, RECOILSTART] = 0;
guns[MACHINEGUN, FIRINGDELAYSTART] = 20;
guns[MACHINEGUN, YOFFSET] = -5;
guns[MACHINEGUN, XOFFSET] = -5;
guns[MACHINEGUN, BOFFSET] = 1;
guns[MACHINEGUN, BANGLEOFFSET] = 1;
guns[MACHINEGUN, SPREAD] = 3;
guns[MACHINEGUN, BSPEED] = 10;
guns[SUBMACHINEGUN, RECOILSTART] = 4;
guns[SUBMACHINEGUN, FIRINGDELAYSTART] = 5;
guns[SUBMACHINEGUN, YOFFSET] = 14;
guns[SUBMACHINEGUN, XOFFSET] = 28;
guns[SUBMACHINEGUN, BOFFSET] = 1;
guns[SUBMACHINEGUN, BANGLEOFFSET] = 1;
guns[SUBMACHINEGUN, SPREAD] = 3;
guns[SUBMACHINEGUN, BSPEED] = 25;
guns[ASSAULTRIFFLE, RECOILSTART] = 4;
guns[ASSAULTRIFFLE, FIRINGDELAYSTART] = 5;
guns[ASSAULTRIFFLE, YOFFSET] = 14;
guns[ASSAULTRIFFLE, XOFFSET] = 28;
guns[ASSAULTRIFFLE, BOFFSET] = 1;
guns[ASSAULTRIFFLE, BANGLEOFFSET] = 1;
guns[ASSAULTRIFFLE, SPREAD] = 3;
guns[ASSAULTRIFFLE, BSPEED] = 25;
guns[KNIFE, RECOILSTART] = 4;
guns[KNIFE, FIRINGDELAYSTART] = 5;
guns[KNIFE, YOFFSET] = 14;
guns[KNIFE, XOFFSET] = 28;
guns[KNIFE, BOFFSET] = 1;
guns[KNIFE, BANGLEOFFSET] = 1;
guns[KNIFE, SPREAD] = 3;
guns[KNIFE, BSPEED] = 25;
guns[SWORD, RECOILSTART] = 4;
guns[SWORD, FIRINGDELAYSTART] = 5;
guns[SWORD, YOFFSET] = 14;
guns[SWORD, XOFFSET] = 28;
guns[SWORD, BOFFSET] = 1;
guns[SWORD, BANGLEOFFSET] = 1;
guns[SWORD, SPREAD] = 3;
guns[SWORD, BSPEED] = 25;
guns[KATANA, RECOILSTART] = 4;
guns[KATANA, FIRINGDELAYSTART] = 5;
guns[KATANA, YOFFSET] = 14;
guns[KATANA, XOFFSET] = 28;
guns[KATANA, BOFFSET] = 1;
guns[KATANA, BANGLEOFFSET] = 1;
guns[KATANA, SPREAD] = 3;
guns[KATANA, BSPEED] = 25;
guns[CLUB, RECOILSTART] = 4;
guns[CLUB, FIRINGDELAYSTART] = 5;
guns[CLUB, YOFFSET] = 14;
guns[CLUB, XOFFSET] = 28;
guns[CLUB, BOFFSET] = 1;
guns[CLUB, BANGLEOFFSET] = 1;
guns[CLUB, SPREAD] = 3;
guns[CLUB, BSPEED] = 25;
guns[MALLET, RECOILSTART] = 4;
guns[MALLET, FIRINGDELAYSTART] = 5;
guns[MALLET, YOFFSET] = 14;
guns[MALLET, XOFFSET] = 28;
guns[MALLET, BOFFSET] = 1;
guns[MALLET, BANGLEOFFSET] = 1;
guns[MALLET, SPREAD] = 3;
guns[MALLET, BSPEED] = 25;


instance_create_layer(x, y, "Todd", objCamera);

// Gun specific vars
currentGun = REVOLVER;
recoilStart = guns[currentGun,RECOILSTART];
firingdelayStart = guns[currentGun,FIRINGDELAYSTART];
yoffset = guns[currentGun,YOFFSET];
xoffset = guns[currentGun,XOFFSET];
boffset = guns[currentGun,BOFFSET];
bangleoffset = guns[currentGun,BANGLEOFFSET];
spread = guns[currentGun,SPREAD];
bSpeed = guns[currentGun,BSPEED];
gx = 0;
gy = 0;