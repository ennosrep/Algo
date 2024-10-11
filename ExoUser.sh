#!/bin/bash
while [ true ]; do
    echo -e "\nMenu de gestion des utilisateurs"
    echo "1. Créer un utilisateur"
    echo "2. Supprimer un utilisateur"
    echo "3. Quitter"
    echo "---------------------------------"
    read -p "Choisissez une option : " opt
    case $opt in

        1) read -p "Entrez le nom du nouvel utilisateur : " name
        if [ $(grep -r $name /etc/passwd | wc -l) -eq "0" ]; then
            sudo adduser $name
        else 
            echo -e "\nCet utilisateur existe déjà. Recommencez."
        fi
        ;;

        2) read -p "Entrez le nom de l'utilisateur à supprimer : " name
        if [ $(grep -r $name /etc/passwd | wc -l) -eq "0" ]; then
            echo -e "\nCet utilisateur n'existe pas. Recommencez."
        else 
            sudo userdel $name
            echo -e "\nCet utilisateur a été supprimé."
        fi
        ;;

        3) exit
        ;;

        *) echo -e "\nCette option n'existe pas. Recommencez."
        ;;
    esac
done
