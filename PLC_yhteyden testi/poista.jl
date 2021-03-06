yhteys2= connect(5002)
#DI 1.Execute         [0/1]        = Onko moottorille annettu liikkelle käskyä
#DI 2.Reserve         [0/1]        = Tyhjä
#DI 3.Torque          [0/1]        = Jos 0, nii lukee 4 rivin tiedot. Jos 1, niin moottori muuttuu torque säätöiseksi. Tämä vaikka kesken ajon
#DI 4.SpeedControl    [0/1]        = Jos 0, nii on paikkasäätöinen. Jos 1, niin on nopeus säätöinen.
#DI 5.Enable          [0/1]        = Onko moottori päällä

#AI 6.TargetPos       [mm]         = Haluttu asema
#AI 7.TargetSpeed     [mm/s]       = Haluttu nopeus. Lähetetään aina
#AI 8.TargetAcc       [mm/s2]      = Haluttu kiihdytysnopeus
#AI 9.TargetDec       [mm/s2]      = Haluttu jarrutusnopeus
#AI 10.TargetTorque   [Nm]         = Haluttu vääntö

#DO 1.InPosition      [0/1]        = Onko asemassa
#DO 2.Enable          [0/1]        = Onko moottori käytössä

# Moottorien järjestys:
    # 1. Stepfeeder carriage
    # 2. Linearfeeder carriage
    # 3. X-carriage L
    # 4. Y-carriage L
    # 5. X-carriage R
    # 6. Y-carriage R
    # 7. Charger spindle L
    # 8. Charger spindle R
    # 9. Charger shaft L
    # 10.Clamp L
    # 11.Clamp R
    # 12.ArmSlider
    # 13.Lathe spindle L
    # 14.Lathe spindle R

moottorin_id = 1.0              # 0
kytkin = 1.0                    # 1
nopeus_säätö = 0.0              # 4
matka = 300.0                   # 6
nopeus = 50.0                   # 7
kiihdytys = sign(nopeus)*80.0   # 8
jarrutus = sign(nopeus)*20.0*-1 # 9


moottori = [moottorin_id,kytkin,0.0,0.0,nopeus_säätö,1.0,matka,nopeus,kiihdytys,jarrutus,0.0]
#moottori = 1.0
#moottori = [3.0,0.0,0.0,0.0,1.0,1.0,60.0,20.0,10.0,-5.0,0.0]
write(yhteys2,moottori)
close(yhteys2)
