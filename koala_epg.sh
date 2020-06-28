#!/bin/bash
#colores script

negrita='\033[1m'

rojo='\033[0;31m'
verde='\033[0;32m'
blanco='\033[0;37m'
azul='\033[0;34m'
borrar='\033[0m'
amarillo='\033[0;33m' 
NC='\033[0m'

#mensajes script

m_arrow() { printf "➜ $@\n"
}
m_correcto() { printf "${verde}✔ %s${borrar}\n" "$@"
}
m_error() { printf "${rojo}✖ %s${borrar}\n" "$@"
}
m_pregunta() { printf "${negrita}${amarillo}Ⴚ(●ტ●)Ⴢ %s${borrar}\n" "$@"
}
sistema() {
tvh42="/storage/.kodi/userdata/addon_data/service.tvheadend42"
tvh43="/storage/.kodi/userdata/addon_data/service.tvheadend43"
alex="/storage/.config/tvheadend"

if [ -d $tvh42 ]; then
   sys="Tvheadend 4.2"

elif [ -d $tvh43 ]; then
   sys="Tvheadend 4.3"

elif [ -d $alex ]; then
   sys="AlexELEC TVH 4.3"

else
   sys="Desconocida"
fi
}
_Koala_cabezera()
{

echo -e ${verde}
cat << "EOF"


██╗  ██╗ ██████╗  █████╗ ██╗      █████╗     ███████╗██████╗  ██████╗ 
██║ ██╔╝██╔═══██╗██╔══██╗██║     ██╔══██╗    ██╔════╝██╔══██╗██╔════╝ 
█████╔╝ ██║   ██║███████║██║     ███████║    █████╗  ██████╔╝██║  ███╗
██╔═██╗ ██║   ██║██╔══██║██║     ██╔══██║    ██╔══╝  ██╔═══╝ ██║   ██║
██║  ██╗╚██████╔╝██║  ██║███████╗██║  ██║    ███████╗██║     ╚██████╔╝
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝      ╚═════╝ 
                                                                      
										
EOF

echo
echo -e "${verde}Web: wwww.jungle-team.com${borrar}"
echo
echo -e "${verde}Grupo Telegram: https://t.me/joinchat/Bv0_2hZ8jH6dsUJFoYG-Rg${borrar}"
echo
echo -e "${rojo}version: 1.0 jungle-team @2019${borrar}"
}

confirmacion() {
  while true; do
    read -r -n 1 -p "${1:-Estas seguro que deseas continuar?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "No valido"
    esac 
  done  
}

_Koala_ayuda()
{

sistema
echo
echo -e "La version de Tvh instalada en su sistema es ${negrita}${azul}$sys${borrar}"
echo
echo -e ${verde}
cat << "EOF"
             |       :     . |  -- Soporte: https://t.me/joinchat/Bv0_2hZ8jH6dsUJFoYG-Rg
             | '  :      '   |  
             |  .  |   '  |  |  -- web: www.jungle-team.com
   .--._ _...:.._ _.--. ,  ' |  
  (  ,  `        `  ,  )   . |  -- Desarrolladores: @loznic89 , @tanha_ro
   '-/              \-'  |   |  
     |  o   /\   o  |       :|  -- Koala epg introduce lista canales, epg y picon Movistar+
     \     _\/_     / :  '   |
     /'._   ^^   _.;___      |  -- Pulsa intro para volver al menu principal
   /`    `""""""`      `\=   |
 /`                     /=  .|
;             '--,-----'=    |
|                 `\  |    . |
\                   \___ :   |
/'.                     `\=  |
\_/`--......_            /=  |
            |`-.        /= : |
            | : `-.__ /` .   |
            |    .   ` |    '|
            |  .  : `   . |  |
            

EOF
}

temporizador()
{
tiempo=15 # segundos

echo
echo -e "${negrita}${rojo}¿ Estas seguro que deseas continuar con la instalacion ?${borrar}"
echo -e "${negrita}${rojo}¡¡¡ Si continua se procedera a instalar epg koala, me joderia que lo hiciera por error${borrar}"
echo ""
contador=${tiempo}
while [[ ${contador} -gt 0 ]];
do
    printf "\rTienes ${negrita}${verde}%2d segundos${borrar} para pulsar ${negrita}${amarillo}Ctrl+C${borrar} y asi cancelar la instalacion!" ${contador}
    sleep 1
        : $((contador--))
done
echo ""
}
#Menu koala epg
lista42 () {
  read -p "Si introduces comunitaria se instalara esta si no por defecto individual: " lista
  if [ "$lista" == "comunitaria" ]; then
    echo
    m_correcto "Se procede a la descarga de lista comunitaria"
    url="http://tropical.jungle-team.online/tvheadend/koala42_comunitaria.tar"
    epg="koala42_comunitaria.tar"
else
    echo
    m_correcto "Se procede a la instalacion de lista individual"
    url="http://tropical.jungle-team.online/tvheadend/koala42_individual.tar"
    epg="koala42_individual.tar"
fi
}

lista43 () {
  read -p "Si introduces comunitaria se instalara esta si no por defecto individual: " lista
  if [ "$lista" == "comunitaria" ]; then
    echo
    m_correcto "Se procede a la descarga de lista comunitaria"
    url="http://tropical.jungle-team.online/tvheadend/koala43_comunitaria.tar"
    epg="koala43_comunitaria.tar"
else
    echo
    m_correcto "Se procede a la instalacion de lista individual"
    url="http://tropical.jungle-team.online/tvheadend/koala43_individual.tar"
    epg="koala43_individual.tar"
fi
}

listaalex () {
  read -p "Si introduces comunitaria se instalara esta si no por defecto individual: " lista
  if [ "$lista" == "comunitaria" ]; then
    echo
    m_correcto "Se procede a la descarga de lista comunitaria"
    url="http://tropical.jungle-team.online/tvheadend/alexelec_comunitaria.tar"
    epg="alexelec_comunitaria.tar"
else
    echo
    m_correcto "Se procede a la instalacion de lista individual"
    url="http://tropical.jungle-team.online/tvheadend/alexelec_individual.tar"
    epg="alexelec_individual.tar"
fi
}

instalacion_c42 () {
 lista42
 temporizador
 wget -q $url
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend42/channel/
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend42/input/
 rm -f /storage/.kodi/userdata/addon_data/service.tvheadend42/epgdb.v2
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend42/imagecache/*
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend42/epggrab/xmltv/channels/*
 rm -rf /storage/.kodi/userdata/Thumbnails/*
 systemctl stop service.tvheadend42
 tar xvf /storage/$epg -C /
 rm -r /storage/$epg
 systemctl restart service.tvheadend42
 systemctl restart kodi
 echo
 m_correcto "Ha finalizado la instalacion de Epg Koala, espere unos segundos y volvera al menu"
 sleep 5
}

instalacion_c43 () {
 lista43
 temporizador
 wget -q $url
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/channel/
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/input/
 rm -f /storage/.kodi/userdata/addon_data/service.tvheadend43/epgdb.v3
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/imagecache/*
 rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/xmltv/channels/*
 rm -rf /storage/.kodi/userdata/Thumbnails/*
 systemctl stop service.tvheadend43
 tar xvf /storage/$epg -C /
 rm -r /storage/$epg
 systemctl restart service.tvheadend43
 systemctl restart kodi
 echo
 m_correcto "Ha finalizado la instalacion de Epg Koala, espere unos segundos y volvera al menu"
 sleep 5
}

instalacion_alex () {
 listaalex
 temporizador
 wget -q $url
 rm -rf /storage/.config/tvheadend/channel/
 rm -rf /storage/.config/tvheadend/input/
 rm -f /storage/.config/tvheadend/epgdb.v3
 rm -rf /storage/.config/tvheadend/imagecache/*
 rm -rf /storage/.config/tvheadend/epggrab/xmltv/channels/*
 rm -rf /storage/.kodi/userdata/Thumbnails/*
 systemctl stop tvheadend
 tar xvf /storage/$epg -C /
 rm -r /storage/$epg
 systemctl restart tvheadend
 systemctl restart kodi
 echo
 m_correcto "Ha finalizado la instalacion de Epg Koala, espere unos segundos y volvera al menu"
 sleep 5
}

instalacion_crossepg () {
 temporizador
 if [ ! -d /usr/share/crossepg/providers/ ]; then
   echo
   m_error "No tiene instalado crossepg en su receptor, realice la instalacion y vuelva a intentarlo"
   sleep 5
 else
   wget -q http://tropical.jungle-team.online/tvheadend/crossepg.tar
   tar xvf crossepg.tar -C /usr/share/crossepg/providers/
   echo
   m_correcto "Ha finalizado la instalacion de Epg Koala, espere unos segundos y volvera al menu"
   sleep 5
fi
}

instalacion_epgimport () {
 temporizador
 if [ ! -d /etc/epgimport/ ]; then
   echo
   m_error "No tiene instalado epg import en su receptor, realice la instalacion y vuelva a intentarlo"
   sleep 5
 else
   wget -q http://tropical.jungle-team.online/tvheadend/epgimport.tar
   tar xvf epgimport.tar -C /etc/epgimport/
   echo
   m_correcto "Ha finalizado la instalacion de Epg Koala, espere unos segundos y volvera al menu"
   sleep 5
fi
}



_Koala_menu()
{
    _Koala_cabezera
    echo -e "${verde}__________________________________________________________________________${borrar}"
    echo
    echo -e "${negrita}${azul}MENU INSTALACION KOALA:${borrar}"
    echo
    echo -e "${blanco}1) Instalacion en Sistema${borrar} ${negrita}${verde}CoreELEC/LbreELEC TVH 4.2${borrar}"
	echo -e "${blanco}2) Instalacion en Sistema${borrar} ${negrita}${verde}CoreELEC/LbreELEC TVH 4.3${borrar}"
	echo -e "${blanco}3) Instalacion en Sistema${borrar} ${negrita}${verde}AlexELEC TVH 4.3${borrar}"
	echo -e "${blanco}4) Instalacion en Sistema${borrar} ${negrita}${verde}Vitmod${borrar}"
	echo -e "${blanco}5) Instalacion en Sistema${borrar} ${negrita}${verde}Enigma2 Crossepg${borrar}"
	echo -e "${blanco}6) Instalacion en Sistema${borrar} ${negrita}${verde}Enigma2 EpgImport${borrar}"
	echo
	echo -e "${blanco}7) Ayuda${borrar}"
    echo
    echo -e "${blanco}9) Salir${borrar}"
    echo
    m_pregunta "Introduce que instalacion desea realizar: "
}

# opcion por defecto
opc="0"
 
# bucle mientas la opcion indicada sea diferente de 9 (salir)
until [ "$opc" -eq "9" ];
do
    case $opc in
        1)
			
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de koala epg"
  				echo
  				instalacion_c42
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de koala epg"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
        2)
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de koala epg"
  				echo
  				instalacion_c43
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de koala epg"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
        3)
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de koala epg"
  				echo
  				instalacion_alex
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de koala epg"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
        4)
            echo -e "${blanco}proximaente${borrar}"
            ;;
        5)
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de koala epg"
  				echo
  				instalacion_crossepg
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de koala epg"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
        6)
			if confirmacion; then
			    echo
  				m_correcto "Se procede a la instalacion de koala epg"
  				echo
  				instalacion_epgimport
  				
			else
			    echo
  				m_error "Has cancelado la instalacion de koala epg"
  				echo
			fi
			sleep 5
			clear
            _Koala_menu
            ;;
        7)
            _Koala_ayuda
            ;;
            
  
        *)
            # Esta opcion se ejecuta si no es ninguna de las anteriores
            clear
            _Koala_menu
            ;;
    esac
    read opc
done
