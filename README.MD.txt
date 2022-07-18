Der Ordner enthält weitere Unterordner (Auswertung, Bike_CSV, Bike_Pollution, Bike_Shortest, Feinstaubdaten, Frontend, Vorverarbeitung) sowie vier .bat-Dateien

Auswertung:
	- enthält alle Python-Skripte, die zur Evaluation des Prototyps verwendet wurden
	- zudem finden sich hier alle zu diesem Zweck erstellten Dateien

Bike_CSV:
	- enthält alle Dateien, die zur Ausführung der CSV-Datei-Variante nötig sind
	- zur Ausführung kann die CSV-Datei.bat ausgeführt werden

Bike_Pollution:
	- enthält alle Dateien, die zur Ausführung der Lua-Profil-Variante nötig sind
	- zur Ausführung kann die Lua-Anpassung.bat ausgeführt werden

Bike_Shortest:
	- enthält alle Dateien, die zur Ausführung der Variante mit der kürzesten Route nötig sind
	- zur Ausführung kann die Shortest.bat ausgeführt werden

Feinstaubdaten:
	- enthält die Feinstaubdaten des DE4L-Projekts

Frontend:
	- enthält das OSRM-Frontend
	- das Frontends basiert node.js und npm wird vorrausgesetzt
	- zur Ausführung des Frontends kann die Frontend.bat ausgeführt werden

Vorverarbeitung:
	- enthält Python-Skripte, die notwendige JSON-Dateien zur Ausührung der OSRM-Instanzen erstellen
	- der Einfachheit halber sind diese JSON-Dateien bereits erstellt


Anmerkungen zur Ausführung:
	- dieser Prototyp setzt Docker voraus (https://www.docker.com/)
	- zur Ausführung der .bat-Dati empfielt es sich, die zip-Datei auf einem lokalen Lautwerk, auf das Docker Zugriff hat, zu entpacken
	- die .bat-Dateien sollten nativ funktionieren, da sie den relativen Pfad nutzen
	- sollte es dennoch nicht funktionieren, zeigt dieses Tutorial, wie die Pfade absolut angepasst werden müssen
	- dazu dann bitte die Variable my_path anpassen
	- (https://gist.github.com/AlexandraKapp/e0eee2beacc93e765113aff43ec77789)

	- wenn die Python-Srkipte selbst ausgeführt werden möchten, müssen zunächst die Python-Module installiert werden - siehe requirements.txt
	- hier bietet es sich an, zunächst Anaconda zu installieren (weil es sonst bei der Installation von pyrosm zu Problemen kommt)
	- https://docs.anaconda.com/anaconda/install/index.html
	- und anschließend die erforderlichen Python-Module installieren

	- alle OSRM-drei Varianten laufen auf Port 5000, daher müsste zur Ausührung einer anderen OSRM-Instanz der jeweilige aktuelle Docker-Container pausiert werden
	
	- die Ausführung des Skriptes Lua-Anpassung sollte ungefähr 15 min dauern
	- die anderen beiden ca. 50 Sekunden
	