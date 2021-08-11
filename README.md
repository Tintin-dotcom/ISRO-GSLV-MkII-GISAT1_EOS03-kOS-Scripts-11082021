# ISRO-GSLV-MkII-GISAT1_EOS03-kOS-Scripts-11082021

Craft files for the rocket, and a version without the parts needed for kOS, are included.

Link to Youtube video:


This is the Kerbal Operating System code for a GSLV Mk-II rocket launch, carrying the GISAT-1 / EOS-03 satellite to GTO.

The code launches the ssatellite into GTO, and also circularizes the orbit of the satellite using an on-board thruster.

The boot.ks file opens the kOS Terminal of the kOS processor directly after launching the vessel. This only works if you right-click the kOS processor attached to the satellite's solar panel, and select boot file "boot.ks". This file has to be placed inside a "Boot" foder in the KSP/Ships/Script directory.

///NOTES///

-> Tested in Kerbal Space Program Version 1.12.2.
