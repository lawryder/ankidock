# ankidock
<h2><u>For your information:</u></h2>

This Container is built for use with Unraid. </br>
It should be possible to use it with every other Docker, too. </br>

Tested with AnkiDroid, Anki 2.1.28 (PC) and Anki 2.1.42 (PC + Mac).</br>
Works with VPN, DynDNS and behind a reverse Proxy.</br>
</br>
</hl>
</br>
<h2><u>01. Setup in Unraid</u></h2>

<h3><u>Update:</u></h3>
-- Repository and Template added to CA </br>
-- Information on 1. is just for backup purposes.</br>
</br>
</br>
This is the data to be filled in the template: </br>
</br>
1) WEBUI:   </br>
http://[Your private IP]:[Port], i.e. http://192.168.xxx.xxx:27701</br>
</br>
2) Extra Parameters:    </br>
--mount type=volume,dst=/anki-sync-server,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/mnt/user/appdata/ankidock/anki-server --mount type=volume,dst=/etc/nginx,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/mnt/user/appdata/ankidock/nginx -it </br>
</br>
3) Post Arguments:</br>
bash</br>
</br>
</br>
Now click on "Add another path, port, [...]" and choose "Port".</br>
Give it a name and insert the following:</br>
Container Port:   27701</br>
Host Port:        [whatever Port you like*], recommended: 27701</br>
</br>
* = if you change it, think about chanking nginx.conf ('listen [PORT]'), too. (see 2.)</br>
</br>
</br>
<h2><u>02. Setup the container</h2></u>
</br>
In order to use the container, there is still a little work needed.</br>
As base directory for every folder in the following, I use '/mnt/user/appdata/ankidock/'.</br>
</br>
1) /anki-sync-server/src/ankisyncd.conf </br>
 -- Enter the internal IP of the Docker (172.17.x.x) </br>
 -- Choose a port as you wish, EXCEPT 27701 [Standard: 27702]</br>
</br>
2) /nginx/sites-enabled/default </br>
 -- On "proxy_pass", also enter your Docker's internal IP.</br>
    Set the same Port that you used under 1)</br>
 -- It should now look like: http://[IP of the container]:[Port]/</br>
</br>
</br>
Now start the container and open the console.</br>
</br>
Change to directory /anki-sync-server/src</br>
</br>
Add a new user.</br>
Use the command: "python3 ankisyncctl.py adduser [username]" </br>
Confirm with Enter and set a password.</br>
You can use "python3 ankisyncctl.py lsuser" to see if your new user has been created.</br>
If everything went right, it should show you a list of all users, including your new user.</br>
</br>
Use "python3 ankisyncctl.py" to show more commands.</br>
</br>
</br>
Now you can run the server itself</br>
Go back to base directory ('cd /') and run './run.sh'.</br>
</br>
</br>
If you get a message that contains sth. like </br>
"Running HTTP on 172.17.x.x on Port 27702" (or whatever you have chosen), then the server is running.</br>
</br>
To test connectivity from outside, open a browser and open </br>
"http://[Private Network IP]:27701" (i.e. http://192.168.xxx.xxx:27701). </br>
You could also use the 'WebUI' button in Unraid.</br>
You are connected if you see a white page with text "Anki Sync Server".</br>
</br>
Your server is running :-)</br>
</br>
</hl>
</br>
<h2><u>03. Setup apps</h2></u>
</br>
For this, I refer to ankicommunity/anki-sync-server.</br>
https://github.com/ankicommunity/anki-sync-server
