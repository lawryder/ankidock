# ankidock
https://hub.docker.com/repository/docker/lawryder/ankidock

<h2><u>Hinweis</u></h2>

Container erstellt zur Nutzung unter Unraid. 
Verwendung in anderen Docker-Umgebungen sollte möglich sein, evtl. sind dann aber andere Anpassungen nötig.

Getestet mit AnkiDroid, Anki 2.1.28 (PC) und Anki 2.1.42 (PC + Mac).
Funktion über Dyn-DNS sowie hinter einem Reverse Proxy kann bestätigt werden.



<h2><u>01) Einrichtung in Unraid</u></h2>

<h3><u>In Arbeit:</u></h3>
-- Hinzufügen des Repositories zu 'Community Applications'
-- Templateerstellung, sodass die beschriebenen Schritte nicht mehr durchgeführt werden brauchen



Nach dem Herunterladen des Containers kann es sein, dass der Container sich nach dem Starten selbst wieder beendet.
Hierzu muss noch das Template geändert werden.

Die folgenden Befehle können noch auf Eure Bedürfnisse angepasst und dann in den genannten Feldern eingetragen werden:

1) WEBUI:   
http://[Eure private Netzwerk-IP]:[Port], z.B. http://192.168.xxx.xxx:27701

2) Extra Parameters:    
--mount type=volume,dst=/anki-sync-server,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/mnt/user/appdata/ankidock/anki-server --mount type=volume,dst=/etc/nginx,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/mnt/user/appdata/ankidock/nginx -dit

3) Post Arguments:
bash


Klickt nun noch auf "Add another path, port, [...]" und wählt "Port" aus.
Vergebt einen Namen und tragt folgendes ein:
Container Port:   27701
Host Port:        [nach Belieben], empfohlen: 27701


Nach dem Speichern könnt Ihr den Server im Dashboard starten.
Er sollte sich nun nicht mehr selbst beenden.




<h2><u>02) Einrichtung des Containers</h2></u>

Nach dem Herunterladen müssen zunächst noch Dateien verändert werden, damit eine Verbindung von außen aufgebaut werden kann. 
Als Ausgangsverzeichnis lege ich jeweils /mnt/user/appdata/ankidock/ zugrunde.

1) /anki-sync-server/src/ankisyncd.conf 
 -- hier die interne IP eures Docker-Containers einfügen (172.17.x.x) 
 -- Den Port nach Belieben ändern, AUßER 27701 [Standard: 27702]

2) /nginx/sites-enabled/default 
 -- bei "proxy_pass" tragt ihr auch wieder die interne IP eures Docker-Containers ein. 
    Hier tragt ihr auch den oben gewählten Port ein. 
 -- Format: http://[IP des Containers]:[Port]/


Startet nun den Container und wechselt in die Konsole.

Begebt euch in den Ordner /anki-sync-server/src

Legt nun einen neuen Benutzer an. 
Der Befehl hierzu lautet (ohne Anführungszeichen): "python3 ankisyncctl.py adduser [Benutzername]" 
Bestätigt mit Enter und wählt ein Passwort aus. 
Kontrolliert am besten, ob alles funktioniert hat, indem Ihr "python3 ankisyncctl.py lsuser" nutzt.
Ihr solltet daraufhin euren Benutzernamen angezeigt bekommen.

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




<h2><u>02) Einrichtung der App</h2></u>

Für die Einrichtung am PC und der Apps verweise ich auf die Kollegen von ankicommunity/anki-sync-server.
Siehe: https://github.com/ankicommunity/anki-sync-server
