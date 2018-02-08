#!/bin/bash

# nos dirijimos al directorio donde esta la aplicacion
echo "Introduzca la ruta de la carpeta para hacer copia en GitHub: "
read ruta
cd $ruta
echo "Introduzca el usuario de github: "
read usergit

echo "Desea comprimir la carpeta? (Recuerda que en GitHub no se pueden subir mas de 100 archivos) si/no"
read respuesta

if [$respuesta == "si"]; then

echo "Introduzca el nombre de la carpeta comprimirda"
read nombre
tar -czvf $nombre.tar.gz $ruta
fi

# Comprobamos si el directorio en el que estamos es de un repositorio git y sino lo creamos
if [ ! -d '.git' ]; then
	export GIT_SSL_NO_VERIFY=1
	#Nos pide el nombre del repositorio creado anteriormente
	echo "Esta carpeta no contiene el archivo .git. Introduzca el nombre del repositorio creado: "
	read repositorio
	echo "# $repositorio " >> README.md
	#inicializamos el archivo .git
	git init
	git add README.md
	git commit -m "first commit script"
	git remote add origin https://github.com/$usergit/$repositorio.git
	git push -u origin master
	exit -1
fi
	# Indicamos a Git todos los archivos para subir
	git add .
	# Esto nos pedira el mensaje del commit
	echo "Introduce el mensaje del commit:"
	read mensaje
	git commit -m "$mensaje"
	# Y terminamos subiendo los archivos
	git push origin master
	git pull -u origin master
