<h2>Fehlerquellen</h2>

<h3>Nach dem Öffnen der WebUI bekomme ich eine Fehlermeldung "Seite nicht erreichbar"!</h3>
Das liegt daran, dass der NGinx-Server beim Öffnen des Containers nicht gestartet wird. </br>
Gebt Ihr in der Konsole "systemctl status nginx" ein, so erhaltet Ihr eine Ausgabe </br>
"status: inactive (dead)". </br>
</br>
Dies behebt Ihr, indem Ihr einfach "nginx" in der Console eingebt. </br>
Bei der erneuten Kontrolle solltet Ihr die Ausgabe "status: active (running)" erhalten. </br>
</br>
<h3>Nach dem Öffnen der WebUI bekomme ich den Fehler "502: Bad Gateway"</h3>
Diese Fehlermeldung erhaltet Ihr, wenn Ihr zwar nginx gestartet habt, aber anki-sync-server noch nicht läuft. </br>
Hierzu wechselt Ihr in das Verzeichnis /anki-sync-server/src und führt folgenden Befehl aus: </br>
"python3 -m ankisyncd". </br>
</br>
Ruft Ihr die WebUI mit laufendem nginx und anki-sync-server auf, so seht Ihr "Anki Sync Server" in schwarzer Schrift auf weißem Hintergrund.
