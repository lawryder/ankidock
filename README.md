# ankidock
https://hub.docker.com/repository/docker/lawryder/ankidock


Container erstellt zur Nutzung unter Unraid. 
Getestet mit AnkiDroid und Anki 2.1.28 (PC).


Benutzung unter Unraid: 

Nach dem Herunterladen müssen zunächst noch Dateien verändert werden, damit eine Verbindung von außen aufgebaut werden kann. 
Als Ausgangsverzeichnis lege ich jeweils /user/appdata/ankidock/ zugrunde.

1) /anki-sync-server/src/ankisyncd.conf 
2) -- hier die interne IP eures Docker-Containers einfügen (172.17.x.x) 
3) -- Den Port nach Belieben ändern, AUßER 27701 [Standard: 27702]

2) /nginx/sites-enabled/default 
3) -- bei "proxy_pass" tragt ihr auch wieder die interne IP eures Docker-Containers ein 
4) -- Hier tragt ihr auch den oben gewählten Port ein. 
5) -- Format: http://[IP des Containers]:[Port]/


Startet nun den Container und wechselt in die Konsole.


Begebt euch in den Ordner /anki-sync-server/src

Legt nun einen neuen Benutzer an. 
Der Befehl hierzu lautet (ohne Anführungszeichen): "python3 ankisyncctl.py adduser [Benutzername]" 
Bestätigt mit Enter und wählt ein Passwort aus. 
Kontrolliert am besten, ob alles funktioniert hat, indem Ihr "python3 ankisyncctl.py lsuser" nutzt.

Um weitere Möglichkeiten anzuzeigen, nutzt "python3 ankisyncctl.py"


Nun wird es aber Zeit, den Server auch zu starten. 

Nutzt dazu den Befehl "python3-m ankisyncd".


Der Server sollte laufen, wenn Ihr eine Ausgabe erhaltet, die in etwa folgendes beinhaltet: 
"Running HTTP on 172.17.x.x on Port 27702" (oder was auch immer Ihr gewählt habt).

Zum Test, ob der Container auch von außen erreichbar ist, könnt Ihr einen Browser öffnen und ruft 
"http://[Private IP]:27701" (also z.B. http://192.168.xxx.xxx:27701) auf. 
Alternativ könnt Ihr in Unraid auch auf WebUI klicken.
Es sollte sich eine weiße Seite mit dem Text "Anki Sync Server" öffnen. Weiterhin sollte die Konsole auch den Zugriff anzeigen.

Ist dies der Fall, könnt Ihr die Konsole nun schließen. Euer Server läuft :-)




Für die Einrichtung am PC und der Apps verweise ich auf die Kollegen von ankicommunity/anki-sync-server.
