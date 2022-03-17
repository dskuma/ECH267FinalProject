# ECH FINAL PROJECT:
### The project codes have been derived from Steve Burton’s Lectures on Youtube and adapted for the case of a double pendulum. 
### The instructions can be found on the code as well.
## DIRECTIONS FOR USING THE CODE: 

  - Setup: 
	The code requires all 4 files - simpend.m,drawpend.m,ODE_Equation_Formulation.m,pendcart.m - placed in the same file:
	The program can be run with just running ODE_Equation_Formulation.m and would need changes to the code to simulate LQR and Pole Placement methods.
	If one wishes, they can uncomment the drawpend function at the end of Simpend.m - Lines 129 - 131.

 - Pole Placement:
	For simulating Pole Placement - the following lines must be commented: Lines 86 -94 I.e the Q matrix, value of R, and Value of K. 
									
											AND
	Lines 84 and 85 must be uncommented: i.e `eigs = []` and `K = ‘ ’` 

 - LQR: 
	Reverse the lines you commented in the Pole Placement and uncomment the ones you commented in Pole Placement and Comment the ones you uncommented.



					 
		 
	
