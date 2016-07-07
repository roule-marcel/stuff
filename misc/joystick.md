#Demo joystick
##Objectif
Controller le robot avec un smartphone via une application "joystick".

##Système
Le robot est controlé par une carte FPGA DE0-Nano qui contient un micro-controller (MCU) openMSP430.
Le MCU est connecté à une Raspberry Pi (RPi) par un lien série UART (physique, dans le robot).
La RPi dispose d'un dongle wifi et génère un AP pour permettre au smartphone de s'y connecter.

##Protocole
Le smartphone se connecte à l'AP du robot généré par la RPi.
Il fait tourner une appli javascript (nodeJS ?) affichant un joystick.
L'appli du smartphone est connectée à une appli nodeJS tournant sur la RPi (socket ?).
L'appli du smartphone lit les inputs de l'utilisateur sur le joystick et génère des commandes moteur.
Il envoie ces commandes (périodiquement ?) à l'appli du RPi, qui les relaye via son port série vers le MCU.
Le MCU fait tourner un firmware C qui reçoit les commandes moteur sur son port série et génère les PWM correspondantes pour faire avancer le robot.

Prévoir une sécurité en cas de déconnection.
Côté MCU : timeout sur la commande pwm (eg. p LEFT RIGHT <TIMEOUT>)

##Tâches
Commande Dongle WIFI -> Jérôme
Appli joystick smartphone -> Jérôme
Appli interface RPi -> Jérôme
Lien UART RPi-MCU -> Laurent
Exemple de protocole RPi-MCU -> Laurent
Génération AP -> Laurent ? Jérôme ?

##Doc
###Génération AP
http://hardware-libre.fr/2014/02/raspberry-pi-creer-un-point-dacces-wifi/
Chip courant : RTL8188CUS <- introuvable sur RS

Dongle "officiel" RPi : http://fr.rs-online.com/web/p/adaptateurs-pour-reseau-sans-fil/8920012/
"Supports Access Point/Infrastructure mode" : http://raspi.tv/2015/new-official-raspberry-pi-wifi-dongle-3-way-testing-vs-thepihut-and-edimax
