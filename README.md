# ankidock
https://hub.docker.com/repository/docker/lawryder/ankidock

<h2><u>Hinweis</u></h2>

Container erstellt zur Nutzung unter Unraid. </br>
Verwendung in anderen Docker-Umgebungen sollte möglich sein, evtl. sind dann aber andere Anpassungen nötig.</br>

Getestet mit AnkiDroid, Anki 2.1.28 (PC) und Anki 2.1.42 (PC + Mac).</br>
Funktion über Dyn-DNS sowie hinter einem Reverse Proxy kann bestätigt werden.</br>
</br>
</hl>
</br>
<h2><u>01) Einrichtung in Unraid</u></h2>

<h3><u>In Arbeit:</u></h3>
-- Hinzufügen des Repositories zu 'Community Applications'</br>
-- Templateerstellung, sodass die beschriebenen Schritte nicht mehr durchgeführt werden brauchen</br>
</br>
</br>
</br>
Nach dem Herunterladen des Containers kann es sein, dass der Container sich nach dem Starten selbst wieder beendet.</br>
Hierzu muss noch das Template geändert werden.</br>
</br>
Die folgenden Befehle können noch auf Eure Bedürfnisse angepasst und dann in den genannten Feldern eingetragen werden:
</br>
1) WEBUI:   </br>
http://[Eure private Netzwerk-IP]:[Port], z.B. http://192.168.xxx.xxx:27701</br>
</br>
2) Extra Parameters:    </br>
--mount type=volume,dst=/anki-sync-server,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/mnt/user/appdata/ankidock/anki-server --mount type=volume,dst=/etc/nginx,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/mnt/user/appdata/ankidock/nginx -dit </br>
</br>
3) Post Arguments:</br>
bash</br>
</br>
</br>
Klickt nun noch auf "Add another path, port, [...]" und wählt "Port" aus.</br>
Vergebt einen Namen und tragt folgendes ein:</br>
Container Port:   27701</br>
Host Port:        [nach Belieben], empfohlen: 27701</br>
</br>
</br>
Nach dem Speichern könnt Ihr den Server im Dashboard starten.</br>
Er sollte sich nun nicht mehr selbst beenden.</br>
</br>
</hl>
</br>
<h2><u>02) Einrichtung des Containers</h2></u>
</br>
Nach dem Herunterladen müssen zunächst noch Dateien verändert werden, damit eine Verbindung von außen aufgebaut werden kann. </br>
Als Ausgangsverzeichnis lege ich jeweils /mnt/user/appdata/ankidock/ zugrunde.</br>
</br>
1) /anki-sync-server/src/ankisyncd.conf </br>
 -- hier die interne IP eures Docker-Containers einfügen (172.17.x.x) </br>
 -- Den Port nach Belieben ändern, AUßER 27701 [Standard: 27702]</br>
</br>
2) /nginx/sites-enabled/default </br>
 -- bei "proxy_pass" tragt ihr auch wieder die interne IP eures Docker-Containers ein. </br>
    Hier tragt ihr auch den oben gewählten Port ein. </br>
 -- Format: http://[IP des Containers]:[Port]/</br>
</br>
</br>
Startet nun den Container und wechselt in die Konsole.</br>
</br>
Begebt euch in den Ordner /anki-sync-server/src</br>
</br>
Legt nun einen neuen Benutzer an. </br>
Der Befehl hierzu lautet (ohne Anführungszeichen): "python3 ankisyncctl.py adduser [Benutzername]" </br>
Bestätigt mit Enter und wählt ein Passwort aus. </br>
Kontrolliert am besten, ob alles funktioniert hat, indem Ihr "python3 ankisyncctl.py lsuser" nutzt.</br>
Ihr solltet daraufhin euren Benutzernamen angezeigt bekommen.</br>
</br>
Um weitere Möglichkeiten anzuzeigen, nutzt "python3 ankisyncctl.py"</br>
</br>
</br>
Nun wird es aber Zeit, den Server auch zu starten. </br>
</br>
Nutzt dazu den Befehl "python3-m ankisyncd".</br>
</br>
</br>
Der Server sollte laufen, wenn Ihr eine Ausgabe erhaltet, die in etwa folgendes beinhaltet: </br>
"Running HTTP on 172.17.x.x on Port 27702" (oder was auch immer Ihr gewählt habt).</br>
</br>
Zum Test, ob der Container auch von außen erreichbar ist, könnt Ihr einen Browser öffnen und ruft </br>
"http://[Private IP]:27701" (also z.B. http://192.168.xxx.xxx:27701) auf. </br>
Alternativ könnt Ihr in Unraid auch auf WebUI klicken.</br>
Es sollte sich eine weiße Seite mit dem Text "Anki Sync Server" öffnen. Weiterhin sollte die Konsole auch den Zugriff anzeigen.</br>
</br>
Ist dies der Fall, könnt Ihr die Konsole nun schließen. Euer Server läuft :-)</br>
</br>
</hl>
</br>
<h2><u>02) Einrichtung der App</h2></u>
</br>
Für die Einrichtung am PC und der Apps verweise ich auf die Kollegen von ankicommunity/anki-sync-server.</br>
Siehe: https://github.com/ankicommunity/anki-sync-server
