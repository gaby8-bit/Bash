afisare()
{
ls -l *.log /var/log | grep $2
echo "$1 $2"
}
while true; do
echo "1.Iesire"
echo "2.Informatii despre variabilele de sistem"
echo "3.Afisare shell-uri(primele 3 ale SO)"
echo "4.Gestionare directoare si fisiere (creare director,mutare in el,creare fisier si copiere)"
echo "5.Mutare si redenumire fisiere"
echo "6.Stergere director"
echo "7.Afisare memorie"
echo "8.Cautare avansata in fisierele din /var/log"
echo "9.Sa se afiseze toate fisierele de log"
echo "Optiunea dvs este:"
read optiune
echo "----------------"
case $optiune in
1) echo "La revedere"
exit
;;

2)echo "Utilizatorul curent este: $USER"
echo "Directorul curent este: $PWD"
echo "Limba setata pentru sistem este: $LANG"
echo "---------------------"
;;

3)head -n 4 /etc/shells
echo "----------------------------"
;;

4) echo "Introduceti numele directorului pe care vreti sa il creati:"
read numed
mkdir $numed
cd $numed
echo "Introduceti numele fisierului pe care vreti sa il creati in director"
read numef
touch $numef
echo "Dupa crearea fisierului o sa ne intoarcem inapoi in directorul parinte"
cd ..
echo "----------------------------------"
;;

5) echo "Introduceti un nume de fisier existent: "
read fisier5
 echo "Introduceti un nume de director existent: "
 read director5
if [  -e "$fisier5" ] && [ -d "$director5" ] 
then mv $fisier5 $director5/
echo "Mutarea s-a reazlizat cu succes"
else
echo "Fisierul sau directorul nu exista"
echo "Introduceti noul nume pentru fisier: "
read numenou
mv $fisier5 $numenou
fi
echo "-------------------------------------------"
;;

6) echo "Introduceti numele directorului de la punctul 4 pentru a-l sterge:"
read fisier6
rm -r $fisier6
echo "Directorul si continutul lui a fost sters cu succes"
echo "----------------------------------------------------"
;;

7) grep MemTotal /proc/meminfo
   grep MemFree /proc/meminfo

 echo "----------------------------------------------------"
;;

8)
 echo "Introduceti cuvantul pe care vreti sa il cautati in numele fisierelor din /var/log"
 read numecautat
sudo ls /var/log | grep $numecautat
echo "----------------------------------------"

;;

9) echo "Dati un fisier de log"
read nume9
echo "Dati un text pe care vreti sa il cautati in fisier"
read text

afisare $nume9 $text
;;
*) echo "Optiunea introdusa nu exista"

;;

esac
done
