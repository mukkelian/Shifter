If you want to shift the whole lattice system into any direction or want to put the complex molecule into the defined crystal box without distorting the system ( defined in terms of lattice parameters a,b,c) for any Density Functional theory (DFT) calculation or want to make slab by providing defined vacuum then this will be very useful.

This program can read the input file named as 'a.xyz' and give the output file named as 'b.xyz'.

Just follow the instructions given on the screen.

I have given the example of a simple common perovskite system, kindly go to the folder name 'perovskite'.

1. perovskite.vesta (original crystal file formed by VESTA software)
2. a.xyz (a 'xyz' formate file, exported from VESTA software )
at lattice parameter
a = 3.91541 ; b = 3.91541 ; c =  3.98902

3. b.xyz (an output file)

at lattice parameter
a = 3.91541 ; b = 3.91541 ; c = 20.0000000
shifted by 5 Angs. along 'z' direction.

steps
1. compile this program by any existing FORTRAN compiler, for my case it is gfortran.

gfortran shifter.f90 -o shifter

you will have an executable named as 'shifter'

2. Open the perovskite.vesta file from VESTA software.

3. Export the current file into 'xyz' formate.
goto
File --> Export Data.. 
and select the file format (choose for the hidden atoms too)

4. Renamed as a.xyz
(In the example folder step 3 and 4 is already done, but you may try these steps for better understanding)

5. Run the program by './shifter' in the terminal or choose your ways.

6. Program will ask you for the lattice parameter.
for our case, I am giving the vacuum and shift it by 5 Angstrom along the z-direction. So I'm giving 3.91541 3.91541 20.0 (a, b, c lattice parameter). Then after it will ask your consent for shifting, type y for yes, and again for direction type z for the z-axis. Then after provide there the shifting parameter as 5 Angstrom. At this step you will have output file 'b.xyz'.

7. Open VESTA for new structure (File--> New Structure) then in 
popped up dialog box goto to 'unit cell'

8. In the 'unit cell' option leave the symmetry part just type the lattice parameter whatever you have typed during running the program.

9. Now go to the 'Structure Parameter' option and import the 'b.xyz' file. (look at the bottom of the dialog box there is an option for import)

10. It will tell you that the given lattice parameter is not the same as before want to change the lattice parameter or not.. something like that. Just press NO there.

11. Apply it and press OK.

12. Now, you have your shifted crystal without losing the atoms at the boundary.

Note:: Whatever the lattice system you have just export into '.xyz' format.
