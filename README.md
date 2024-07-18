# Non-Steam-Game-Handler
Configure the app under the [CONFIG] section in the config.cfg file, then add the exe as a non-steam game and change the name of it in Steam to your chosen app or game.


If you are adding a launcher as the game (such as battle.net launcher for example, so you can launch Diablo or Overwatch with Steam Overlay) then under the [OVERSEE] section you can configure the processes to exit whenever the app's exe under the [CONFIG] section closes (and if under the [SWITCHES] section, the OverseeApplicationExit equals 1) then you can change the "ExitExecutable1" and "ExitExecutable2" and "ExitExecutable3".


The application is currently configured to launch battle.net through the "Diablo II Resurrected Launcher.exe" under [CONFIG] section at "LauncherDirectory" and "LauncherExecutable", then it waits for the existence of the application under [CONFIG] section at "ApplicationDirectory" and "ApplicationExecutable" which here is the game executable for Diablo 2 Resurrected: "D2R.exe". When this process exists it waits for it to close, and when it closes, it exits battle.net seamlessly under [OVERSEER] section "ExitExecutable1" and "ExitExecutable2" settings. For Battle.net to close, you must close "battle.net.exe" as well as "Agent.exe" so when D2R.exe closes, it will close both of these to gracefully close your nonsteam game. Using this process, you can simply add "LAUNCH_APP.exe" as a non-steam game, rename it to Diablo 2: Resurrected, and then launch that in Steam to play Diablo 2 Resurrected with Steam Overlay. This same system can be used to play any non-steam game with Steam Overlay, and automatically handle / close any needed components to ensure the Steam game exits gracefully as any actual Steam game would when you close it.


# SETUP SETS
Add the application you want to launch under [CONFIG] section at "LauncherDirectory" and "LauncherExecutable".

Add the application you want to wait for the existence of under [CONFIG] section at "ApplicationDirectory" and "ApplicationExecutable". This can be identical to the lines you added under [CONFIG] section at "LauncherDirectory" and "LauncherExecutable" IF you are not adding a launcher such as battle.net launcher or Origin.

Add the processes under [OVERSEER] section "ExitExecutable1", "ExitExecutable2", and ""ExitExecutable3" that you want to close when you close the application under under [CONFIG] section at "ApplicationDirectory" and "ApplicationExecutable" exits. You can leave these blank if you are not needing to close a launcher like Battle.net's processes or Origin's.

Add "LAUNCH_APP.exe" as a non-steam game, rename it in Steam to whatever game or application's name that you have it configured for, etc.

To use this for different applications, simply make another folder and copy the exe and config file to it, change the new config file to reflect your desired second app or game, etc. Rename it in Steam, etc.
