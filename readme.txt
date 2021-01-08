MULTIMEDIJSKI SUSTAVI Z9 - Kombiniranje dvije fotografije u jednu (morph)
Autor: Iva Tutiš
Datum: 07.01.2020
ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ
ZADATAK:

Prema uputama sa stranice http://www.cs.cmu.edu/afs/andrew/scs/cs/15-463/f07/proj3/www/wwedler/ (ili neke druge stranice), napravite program koji ovisno o položaju klizača kombinira dvije fotografije putem njihove konveksne kombinacije. Klizač se pomiče od 0 do 1 s korakom 0.02. Zadatak možete izrađivati u skupinama od najviše troje studenata. Napraviti pretvorbu para testnih fotografija.

Mjerite vrijeme potrebno za transformaciju i ispisujte ga u donjem desnom kutu. Pritiskom na razmaknicu (space) ovaj ispis se može uključiti i isključiti.
Koristite sustav od 43 kontrolne točke, kao u članku. 
ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ
IZVEDBA:

Sav program je napisan u Processing (3+ verzija).

U folderu ControlPointFinder je program ControlPointFinder.pde koji iz pripremljenih slika u ControlPointFinder/data/ konstruira .data file-ove koji sadrže popise koordinata (43 para koordinata po slici) kao što su navedene na http://www.cs.cmu.edu/afs/andrew/scs/cs/15-463/f07/proj3/www/wwedler/. 
Ostale .pde datoteke su pomoćni dijelovi koda odvojeni radi preglednosti. 

Nakon generiranja .data popisa koordinata pomoću programa ControlPointFinder, .data datoteke koje su nastale kao rezultat se kopiraju i zalijepe u Morphing/ folder. 

U folderu Morphing je glavni program Morphing.pde sa popratnim pomoćnim programskim .pde datotekama, koji na slikama u Morphing/data/ pomoću popisa koordinata primjenjuje transformacije kao što su opisane u http://www.cs.cmu.edu/afs/andrew/scs/cs/15-463/f07/proj3/www/wwedler/. 
-------------------------------------------------------------------------------------------
OPIS DATOTEKA U ControlPointFinder PROJEKTU

/ControlPointFinder/data/ = slike iz kojih izvlačimo koordinate
/ControlPointFinder/ControlPointFinder.pde = glavni program za izvlačenje koordinata
/ControlPointFinder/ControlPointFinder_funkcije.pde = kod sa pomoćnim funkcijama
	
	---> REZULTATI PROGRAMA : pic1.data ; pic2. data
-------------------------------------------------------------------------------------------
OPIS DATOTEKA U Morphing PROJEKTU

Morphing/data/ = slike nad kojima vršimo transformacije 
Morphing/Morphing.pde = glavni program za transformaciju
Morphing/Triangle.pde = opis klase trokut
Morphing/Transform_triangle.pde = kod funkcije za transformaciju elemenata klase Triangle
Morphing/FirstDraw.pde = kod funkcije kojom crtamo trokute prvi put (nakon toga ih crta klasa slider)
Morphing/Slider.pde = opis klase Slider (menažira morphing/blending/slider na slici/alpha vale)
Morphing/keyPressed.pde = event handler za pritisak tipke Space (ispis vremena transformacije)
