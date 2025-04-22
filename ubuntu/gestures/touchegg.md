## Touchegg installation for 3 finger gestures setup. 
(For non-GNOME environments)

### 1. Install the touchegg pacakge
```
sudo add-apt-repository ppa:touchegg/stable
sudo apt update
sudo apt install touchegg
```

### 2. Enable touchegg as a systemd service
```
systemctl --user enable touchegg.service
systemctl --user start touchegg.service
```

### 3.Add configs

`nano ~/.config/touchegg/touchegg.conf`

```
<touchégg>
  <settings>
    <property name="animation_delay">150</property>
    <property name="action_execute_threshold">20</property>
    <property name="color">auto</property>
    <property name="borderColor">auto</property>
  </settings>
  <application name="All">
    <gesture type="PINCH" fingers="3" direction="IN">
      <action type="CLOSE_WINDOW">
        <animate>true</animate>
        <color>F84A53</color>
        <borderColor>F84A53</borderColor>
      </action>
    </gesture>
    <gesture type="PINCH" fingers="4" direction="OUT">
      <action type="SHOW_DESKTOP">
        <animate>true</animate>
      </action>
    </gesture>
    <gesture type="PINCH" fingers="4" direction="IN">
      <action type="SEND_KEYS">
        <repeat>false</repeat>
        <modifiers>Super_L</modifiers>
        <keys>A</keys>
        <on>begin</on>
      </action>
    </gesture>
    <gesture type="TAP" fingers="2" direction="UNKNOWN">
      <action type="MOUSE_CLICK">
        <button>3</button>
        <on>begin</on>
      </action>
    </gesture>
    <gesture type="TAP" fingers="3" direction="UNKNOWN">
      <action type="MOUSE_CLICK">
        <button>2</button>
        <on>begin</on>
      </action>
    </gesture>
    <gesture type="SWIPE" fingers="3" direction="LEFT">
      <action type="CHANGE_DESKTOP"></action>
    </gesture>
    <gesture type="SWIPE" fingers="3" direction="RIGHT">
      <action type="CHANGE_DESKTOP"></action>
    </gesture>
    <gesture type="SWIPE" fingers="3" direction="UP">
      <action type="SEND_KEYS">
        <modifiers>Control_L</modifiers>
        <keys>F10</keys>
        <repeat>false</repeat>
        <animation>NONE</animation>
        <on>end</on>
      </action>
    </gesture>
    <gesture type="SWIPE" fingers="3" direction="DOWN">
      <action type="SEND_KEYS">
        <modifiers>Control_R</modifiers>
        <keys>F10</keys>
        <repeat>false</repeat>
        <animation>NONE</animation>
        <on>end</on>
      </action>
    </gesture>
  </application>
  <application name="chromium-browser">
    <gesture type="PINCH" fingers="2" direction="IN">
      <action type="SEND_KEYS">
        <repeat>true</repeat>
        <modifiers>Control_L</modifiers>
        <keys>KP_Subtract</keys>
        <decreaseKeys>KP_Add</decreaseKeys>
      </action>
    </gesture>
    <gesture type="PINCH" fingers="2" direction="OUT">
      <action type="SEND_KEYS">
        <repeat>true</repeat>
        <modifiers>Control_L</modifiers>
        <keys>KP_Add</keys>
        <decreaseKeys>KP_Subtract</decreaseKeys>
      </action>
    </gesture>
  </application>
  <application name="google-chrome">
    <gesture type="PINCH" fingers="2" direction="IN">
      <action type="SEND_KEYS">
        <repeat>true</repeat>
        <modifiers>Control_L</modifiers>
        <keys>KP_Subtract</keys>
        <decreaseKeys>KP_Add</decreaseKeys>
      </action>
    </gesture>
    <gesture type="PINCH" fingers="2" direction="OUT">
      <action type="SEND_KEYS">
        <repeat>true</repeat>
        <modifiers>Control_L</modifiers>
        <keys>KP_Add</keys>
        <decreaseKeys>KP_Subtract</decreaseKeys>
      </action>
    </gesture>
  </application>
</touchégg>

```


### 4.Restart touchegg
systemctl --user restart touchegg.service


### 5. ---Extra Notes---

**Verify touchegg installation**
`which touchegg`
<br>

**Touche GUI**

Flatpak [link here](https://flathub.org/apps/com.github.joseexposito.touche)

Installation: 
```
flatpak install flathub com.github.joseexposito.touche
```

Run: 
```
flatpak run com.github.joseexposito.touche
```

**Note:** [Flathub installation guide](https://flathub.org/setup)

<br>

**--> Add flatpak remote url if not present**, before installing the touche pacakge
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.joseexposito.touche
```

<br>

**-->** If there's **conflict because touchegg.config is already existing**, create a backup and remove it 
```
mv ~/.config/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf.bak
```

<br>

Now run touchegg
```
flatpak run com.github.joseexposito.touche
```
<br>

**(Optional)Post Setup: Remove the Touche GUI**
```
flatpak uninstall com.github.joseexposito.touche```

