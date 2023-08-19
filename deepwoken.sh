#!/bin/bash

# Bro, I should stop cooking demonic stuff bro this is wild!!!
#____        _          _____      _     _
#|  _ \ _   _| | _____  | ____|_ __(_)___(_) __ _
#| | | | | | | |/ / _ \ |  _| | '__| / __| |/ _` |
#| |_| | |_| |   <  __/ | |___| |  | \__ \ | (_| |
#|____/ \__,_|_|\_\___| |_____|_|  |_|___/_|\__,_|
clear
echo " ____                               _" | lolcat
sleep 1
echo "|  _ \  ___  ___ _ ____      _____ | | _____ _ __ " | lolcat
sleep 1
echo "| | | |/ _ \/ _ \ '_ \ \ /\ / / _ \| |/ / _ \ '_ \ " | lolcat
sleep 1
echo "| |_| |  __/  __/ |_) \ V  V / (_) |   <  __/ | | | " | lolcat
sleep 1
echo "|____/ \___|\___| .__/ \_/\_/ \___/|_|\_\___|_| |_| " | lolcat
sleep 1
echo "                |_| " | lolcat
sleep 1
clear
read -p "Enter your name Woken Soul... " woken_name
clear
woken_level=20
woken_hp=140 # Usually a max lvl deepwoken build has around 450-470 hp
woken_max_hp=140

boss_name="Duke Erisia"
boss_level=20
boss_hp=150 # Should've been 15k but I gotta make this fair lmao
boss_max_hp=150

echo "$boss_name, approaches you"
sleep 2
echo "$boss_name: So you're the one running about tripping my alarms. Care to explain yourself?"
sleep 2
echo "$woken_name: The Lord Regent sent me to retrieve the Forge."
sleep 2
echo "$boss_name: That thing is finally making its move. hm? I'd thought it would come personally, but the Lord Regent must see me as a mere agent's workload."
sleep 2
echo "$woken_name: That 'thing'? Agent?"
sleep 2
echo "*The Duke eyes you up and down for a moment before bursting into a roaring laughter. *"
sleep 1
echo "$woken_name: What are you doing with the Forge?"
sleep 2
echo "$boss_name: *He narrows his eyes, deathly cold* Everything I can do to stop the oncoming catastrophe, you indolent worm. With it, I turn useless fools like you into something of use... You don't know what I do for mankind."
sleep 2
echo "$woken_name: What?"
sleep 2 
echo "$boss_name: The Duke Smiles* I'd thought for sure you were an agent, but you're what- let me guess, some notable Etrean adventurer or something? That island's prospects are certainly grim..."
sleep 2
echo "$woken_name: What are you talking about?"
sleep 2
echo "$boss_name: There's no real point in explaining further, as this is the end of the line. Even if you gave up on the Forge, I'm not about to let one who's seen this manor's layout roam free."
sleep 3
clear
echo "What are you going to do.. Woken Soul?"


function battle() {

    clear
    echo "$boss_name (Level $boss_level) blocks your way"
    sleep 2 
    
    while [[ $woken_hp -gt 0 && $boss_hp -gt 0 ]]; do
        echo "$woken_name (Level $woken_level) HP: $woken_hp/$woken_max_hp"
        echo "$boss_name's HP: $boss_hp/$boss_max_hp"

        sleep 3
        echo "1. Attack" | lolcat
        echo "2. Defend" | lolcat
        echo "3. Run"    | lolcat
        read -p "Choose an action: " choice

        case $choice in
            
            1)
                woken_attack=$((1 + RANDOM % 5))
                boss_attack=$((1 + RANDOM % 3))
                boss_hp=$((boss_hp - woken_attack))
                woken_hp=$((woken_hp - boss_attack))
                echo "You casted 'Astral Wind', it dealt $woken_attack damage to $boss_name"
                echo "$boss_name casted 'PILLARS OF ERISIA', it dealt $boss_attack damage to you"
                ;;
            2)
                woken_defense=$((1 + RANDOM % 5))
                boss_attack=$((1 + RANDOM % 3))
                if [[ $boss_attack -gt $woken_defense ]]; then
                    damage_taken=$((boss_attack - woken_defense))
                    woken_hp=$((woken_hp - damage_taken))
                    echo "$woken_name chose to defend. $woken_name blocked $woken_defense damage"
                    if [[ $((RANDOM % 2)) -eq 0 ]]; then
                        echo "$woken_name counterattacked, dealing $woken_defense damage to $boss_name"
                        boss_hp=$((boss_hp - woken_defense))
                    fi
                    echo "$boss_name's attack dealt $damage_taken damage to you"
                else
                    echo "$woken_name chose to defend, but the defense was strong enough to completely block $boss_name's attack"
                fi
                ;;
            
            3) 
                echo "You ran away"
                sleep 2
                echo "$boss_name: I knew that you were a coward ever since you entered this manor, I have a feeling that we'll meet again.."
                return
                ;;
            *)
                echo "$boss_name: Idiot you have no other option. TRY AGAIN!"
                ;;
        esac
    done 

    if [[ $woken_hp -gt 0 ]]; then
        clear
        echo "$boss_name is knocked!"
        sleep 3
        echo "You attempt to grip him"
        sleep 3
        echo "$boss_name: Can't you see what I'm doing for humanity?!"
        sleep 3
        echo "You killed him... $boss_name is dead!"
    else
        clear
        echo "You're knocked!"
        sleep 3
        echo "$boss_name: You're too weak, you'll never retrieve The Forge."
        sleep 3
        echo "$boss_name killed you... $woken_name is dead!"
    fi
}

while true; do

    echo "1. Battle"
    echo "2. Exit"
    read -p "Choose wisely: " option

    case $option in
        1)
            battle
            ;;
        2)
            echo "Bye.. Woken Soul"
            exit 
            ;;
        *)
            echo "..."
            ;;
    esac 
done
