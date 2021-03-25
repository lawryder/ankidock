<h2>Errors</h2>

<h3>WebUI shows "Site not reachable"!</h3>
Reason for this is that nginx webserver is not started by default.</br>
Check this by using "systemctl status nginx". It should show sth. like </br>
"status: inactive (dead)". </br>
</br>
Change this by simply write in console "nginx".</br>
When you check it again, output will be "status: active (running)". </br>
</br>
<h3>WebUI shows "502: Bad Gateway"</h3>
Reason for this is that you have nginx running, but not anki-sync-server.</br>
Open console, navigate to /anki-sync-server/src and use the following command: </br>
"python3 -m ankisyncd". </br>
</br>
If you see no errors and open WebUI again, you should see "Anki Sync Server" on a white background.

