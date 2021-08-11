clearscreen.
wait 4.
stage.
lock throttle to 1.
set runmode to "Liftoff".
set tarlon to 90.
set tes1 to "n".

until runmode = "Done" {
	if runmode = "Liftoff" {
		if ship:apoapsis > 80000 {
			lock throttle to 0.
			set runmode to "Coastphase1".
		}
		turn(90).
		
		if ship:stagedeltav(ship:stagenum):current < 25 {
			wait 2.
			stage.
		}
	}
	else if runmode = "Coastphase1" {
		if eta:apoapsis < 42 and tes1 = "n" {
			stage.
			rcs on.
			set ship:control:fore to 1.
			wait 1.
			lock throttle to 1.
			wait 1.
			set ship:control:fore to 0.
			wait 7.
			stage.
			set tes1 to "y".
		}
		if ship:periapsis > 70000 {
				lock throttle to 0.
				set runmode to "Coastphase2".
		}
	}
	
	else if runmode = "Coastphase2" {
		if ship:longitude < tarlon + 0.1 and ship:longitude > tarlon - 0.1 {
			set ship:control:fore to 1.
			wait 1.
			lock throttle to 1.
			wait 1.
			set ship:control:fore to 0.
			set runmode to "transfer".
		}
	}
	
	else if runmode = "transfer" {
		if ship:apoapsis > 2854000 {
			lock throttle to 0.
			wait 5.
			stage.
			set runmode to "Coastphase3".
		}
	}
	
	else if runmode = "Coastphase3" {
		if eta:apoapsis < 35 {
			stage.
			lock throttle to 1.
			set runmode to "Circularization".
		}
	}
	
	else if runmode = "Circularization" {
		if ship:orbit:period > 21598 {
			lock throttle to 0.
			wait 4.
			toggle ag1.
			wait 2.
			toggle ag2.
			unlock steering.
			set runmode to "Done".
		}
		else if ship:orbit:period > 21000 {
			lock throttle to 0.1.
		}
		
	}
		
	printVesselStats().
}
sas on.

function printVesselStats {
	clearscreen.
	print "Telemetry:" at(1, 4).
	print "Altitude above sea level: " + round(ship:altitude) + "m" at(10, 5).
	print "Current apoapsis: " + round(ship:apoapsis) + "m" at (10, 6).
	print "Current periapsis: " + round(ship:periapsis) + "m" at (10, 7).
	print "Orbital velocity: " + round(ship:velocity:orbit:mag * 3.6) + "km/h" at(10, 9).
	print "Ship longitude: " + round(ship:longitude) + "º" at (10, 10).
}

function turn {
	parameter heading.
	if alt:radar < 1000 {
		lock angle to 90.
		lock steering to heading(heading, angle).
	}
  if alt:radar > 24000 and alt:radar < 36000{
		lock angle to 	90 - 1.03 * alt:radar^.4.
		lock steering to heading(heading, angle).
	}
	if alt:radar > 60000 {
		lock steering to prograde.
	}
	if alt:radar > 36000 and alt:radar < 60000 {
		lock angle to 15.
		lock steering to heading(heading, angle).
	}
	
	if alt:radar > 1000 and alt:radar < 24000 {
		lock angle to 107 - 1.03287 * alt:radar^.4.
		lock steering to heading(heading, angle).
	}
}

