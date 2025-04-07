# Element-Rotated-Cylindrical-Array-Code
The codes enclosed is an example of synthesizing a flat-top pattern for a 24-element cylincrical conformal array by optimizing the element rotations and excitation phases, which is just the first example in the article entitled 'Synthesizing Shaped-Beam Cylindrical Conformal Array Considering Mutual Coupling Using Refined Rotation/Phase Optimization'. 

'MainPro_pos' is the main procedure; 'pso' is the CF-PSO algorithm; 'fit_cal' is used to calculate the fitness function value; 'aff' is used to calculate the array patter; 'rEPhi_VAEP' and 'rETheta_VAEP' are the full-wave simulated two components of the vectorial element patterns.

Identical VAEPs are utilized for all the elements in this example for simplicity, but it is easy to change them to those obtained by full-wave simulating your own antenna array;

Since the codes are for cylincrical conformal arrays with only one row of elements and only a cut of pattern is considered, the rotation and pattern calculation are simplified accordingly. If you require codes for cylincrical conformal arrays with multiple rows of elements and 3D pattern calculation, please contact the authors via the email in the paper. Matlab HFSS API codes are not included since they are available on the internet. If you need, please also email the authors. 

If you have any question, please leave a message or send a email. Thank you.

Please cite the paper: 
M. Li, Y. Liu, S. -L. Chen, J. Hu and Y. J. Guo, "Synthesizing Shaped-Beam Cylindrical Conformal Array Considering Mutual Coupling Using Refined Rotation/Phase Optimization," in IEEE Transactions on Antennas and Propagation, vol. 70, no. 11, pp. 10543-10553, Nov. 2022, doi: 10.1109/TAP.2022.3209268.
