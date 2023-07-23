Scopul temei este de a aplica o functie de interpolare pe o imagine(respectiv pe o functie de doi parametrii).

Interpolarea proximala:
Peste tot unde imaginea este alb negru ne asiguram ca nr de culori sa nu fie mai mare ca 1
-Proximal 2x2
	se aplica pe o imagine alb-negru unde punctele sunt echidistante iar distanta este STEP
	->se definest coordonatele x y in functie de step
	->n devine lungimea x ului
	->rezultatul trebuie initializat cu o matrice de 0 de marime n
	->parcurgem fiecare pixel si tinem cont de media lor pentru a aproxima corect
	->calculam pentru imaginea finala pixelul
	
-Proximal 2x2 RGB
	->extragem cele 3 canale, calculam in functie de proximal 2x2 dand ca param pe rand cele 3 canale
	->formam noua imagine lipind cele 3 canale
-Proximal resize
	->intializam matricea cu nul
	->calculam factorii de scalare si avem grija la indicii din intervali sa fie la -1
	->parcurgem fiecare pixel din imagine
		->aplicam transformata inversa asupra coordonatelor
		->adunam cu 1 ca sa trecem in sistemul de coord 1,n
		->gasim cel mai apropiat pixel
		->calculam valoarea pixelui din final
	->pentru a fi o imagine valida transformam functia in unit8
-Proximal resize RGB
	->extragem cele 3 canale, calculam in functie de resize dand ca param pe rand cele 3 canale
	->formam noua imagine lipind cele 3 canale
-Proximal rotate
	->calculam cosinusul si sinusul unghiului de rotatie
	->parcurgem fiecare pixel
		->aplicam transformata inversa asupra coordonatelor
		->adunam cu 1 ca sa trecem in sistemul de coord 1,n
		->daca xp sau yp sunt in exteriorul img punem un pixel negru si trecem mai departe
		->vedem ce puncte incojoara v(1) si v(2) si calculam pentru ei coeficientul de interpolare
		->calculam valoarea interpolata a pixelului
	->pentru a fi o imagine valida transformam functia in unit8
-Proximal rotate RGB
	->extragem cele 3 canale, calculam in functie de resize dand ca param pe rand cele 3 canale
	->formam noua imagine lipind cele 3 canale

Interpolarea bicubica:

-precalc_d
Plecam de la dimensiunea imaginii si luam pe rand Ix Iy si Ixy
	->Pentru Ix, Iy si Ixy verificam pana la maximul dimensiunii fiecare in parte si salvam derivata.
	 Asta realizam in functiile fx, fy si fxy. In fiecare trebuie sa verificam ca x sa fie <= decat dim lui f(care este I)
	si sa folosim formula corespunzatoare oferita in pdf. Daca depaseste atunci devine 0. La fel y <= n si cele doua simultan
	
-bicubic_coef
	-> Pentru a calcula matricea A de coef de interpolare intre cele 4 puncte vom folosi derivatele precalculate
	-> F prima pe care o dam. S este a doua iar pentru a treia o folosim pe prima transpusa ca F'. Dupa ce le
	transformam in double le inmultim si asa obtinem A-ul dorit
-bicubic resize
	redimensioneaza imaginea de marime m, n in dimensiunea p,q daca e alb-negru
	-> in aceasta functie vom salva in v vechiile coord si vom parcurge fiecare pixel pentru noile dimensiuni
	-> folosim floor si ceil pentru a aproxima in numere intregi si astfel gasim cele 4 puncte ce inconjoara x,y
	-> pentru A vom calcula coef de interpolare folosind functia bicibuic_coef.
	-> in matricea rezultata trecem pe urm pozitie rezultatele la puterea corespunzatoare
	->pentru a fi o imagine valida transformam functia in unit8
-bicubic resize RGB
	-> calculam acelasi lucru dar de data asta imaginea este RGB
	-> pentru asta vom extrage in R, G si B canalele rosu, verde respectiv albastru
	-> pe fiecare canal aplicam functia de resize normala unde vom da ca parametru si dimensiunea p,q
	->folosim cat si concatenam cele 3 canale de culori