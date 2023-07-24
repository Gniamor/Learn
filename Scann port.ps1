Clear-Host

$ports = Read-Host "Quelle port souhaitez vous scannez? ( séparation par virgule )"
$ip =  Read-Host "Quelle est l'ip ou le domain a tester ? "

$export = "le nom de domaine ou adresse ip de ce scann est $ip _" 

#test si le domaine ou ip répond 
$ping = Test-Connection $ip -quiet

#si le domaine/ip répond alors on exécute le suite
if ( $ping -eq "True" ) 
{

#mise en forme du test de l'utilisateur pour le tableau
$array = $ports -split ','

#boucle pour les numble de port demandé
 $array | ForEach-Object {$port = $_; if (
                                            #test de réponse du port
                                            Test-NetConnection -ComputerName $ip -Port $port -InformationLevel Quiet #-WarningAction SilentlyContinue
                                         ) 
                                                #message d'information
                                                {
                                                Write-Output "Port $port est ouvert"
                                                $export = $export + "Port $port est ouvert _"
                                                
                                                }

                                      #message d'information contraire
                                      else {
                                      Write-Output "Port $port est fermé"
                                      $export = $export + "Port $port est fermé _"
                                      } 
                                      
                         }


}
else
{
#si le domaine ne répond pas
 Write-Output "le domaine ne répond pas"
}

#remise a 0 du svg
$svg = "0"

#choix de la sauvegarde
$svg = read-host "Souhetez-vous sauvegardé vos scann ? o/n"

#si choix sauvegarde
if ( $svg -match "o" ) {


#mise en forme pour le fichier
$exportation = $export -split '_'

#récupération de la date au format souhaité 
$date =  Get-Date -format "dd-MM-yyyy"

#récupération de la localisation du fichier de sauvegarde et nomage approprié
[string]$fichier = "C:\Users\Public\scan-port_$date.txt"


#ajout du contenue dans le fichier avec la création si il n'existe pas 
add-content $fichier $exportation

#information utilisateur
Write-Output "le résultat de ce teste bien été enregistré dans le dossier utilisateur public ici $fichier"

}


#si choix non sauvegare
if ($svg -match "n"){

 Write-Output aurevoir

}

# else { echo "donné incorrecte" }

pause
