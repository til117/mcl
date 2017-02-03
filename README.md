# mcl
An implementation of the Monte Carlo Localization (MCL) algorithm as a particle filter. 
The SIR algorithm, with slightly diﬀerent changes for the prediction and update steps, is used for a tracking problem and a global localization problem in a 3D state space (x,y,θ).

Simulated in MATLAB for data analysis, as part of an applied estimation course at KTH.

# Background

Target tracking: We want to repeatedly estimate where the object is located at each time-step given some [inaccurate] information about how the target has moved from the previous time-step, some measurements and the initial position of the target (the position of the target in the ﬁrst time step).

In general, assuming that the process noise is independent of the state, we can break down the prediction step to two steps (applying motion + diﬀusion). 

I use odometry as the motion model in this filter.

Resampling:

-Vanilla(Multinomial) Re-Sampling: The most simple method to carry out the re-sampling step. The method draws particles independently using N random variables and the Cumulative Distribution Function(CDF) of the weights of the particle set.

-Systematic re-sampling(Stochastic Universal re-sampling): an alternative method for re-sampling which oﬀers better speed in addition to better variance.

Both resampling methods are available in the filter.

Data Association: The Maximum Likelihood Data Association Algorithm is used.

Weighting & Outliers: Having computed the associations, weights and outlier detection methods are simply defined using measures like the average likelihood of particles.

Check the corresponding .m files for the algorithms/implementation of each method.

# Instructions

The file runlocalization_MCL.m function is the entrance point to the code. The structure of the code is very similar to the other project "ekf" which utilizes a Kalman filter instead. Here we have mcl.m instead of ekf_localization.m though.

You can deﬁne a tracking problem by deﬁning the initial position(the start pose input variable). If you want the code to perform global localization, you need to pass an empty array(i.e. start pose = []) to the entrance function.

The particle set is represented with a matrix instead of a structure: the weight of the particles are concatenated to the particle set. Therefore, the particle set is be of dimension 4 × M.

The verbose parameter determines the verbose level (0= no visual output and bigger values correspond to more visual
information).

You can use the USE_KNOWN_ASSOCIATIONS parameter for debugging purposes if you want.

Data sets are provided in their folder.

An example command to run your code on the map "map_o3.txt" and sensor readings "so_o3_ie.txt" is:

runlocalization_MCL(’so_o3_ie.txt’, ’map_o3.txt’, 1, 1, 1, 2);

Legend: color coded by red= estimated, green=true, and blue=odometry. Often the red is mostly covered by the green and thus not very visible (or the other way around).

You can try diﬀerent number of particles. Play with the process and measurement noise covariance matrices and pay attention how the performance of the ﬁlter is aﬀected by them.  You need compensation noises in order to make the ﬁlter work correctly (you need to model stronger noises than the actual noises in the underlying system).

Note that you need to use more particles in a global localization problem compared to a tracking problem, especially in cases that multiple hypotheses match the measurements and the particle set also agrees with the hypotheses. For example, if you perform a global localization on the so_pb_40 no data set, as the environment is perfectly symmetric, you have 160 valid hypotheses for the entire simulation!

# How I use it

In the project, I run certain data sets under certain conditions:

1. map_sym2.txt + so_sym2_nk:

This data set corresponds to a perfectly symmetric environment with 4 landmarks. Notice that you need to increase the part bound variable(in init.m, e.g. part bound = 20) to be able to keep all hypotheses. Try tracking and global localization in this data set.

2. map_sym3.txt + so_sym3_nk: 

This data set corresponds to a nearly symmetric environment with 5 landmarks. At ﬁrst, there are multiple valid hypotheses but, approximately after the time step 180 the robot observes the top right landmark which breaks the symmetry and only one hypothesis remains valid. 

To see when the ﬁlter converges to the correct
hypothesis, you can the line:

’if (count > 170)&(count < 250) pause; end’

and hit enter for each iteration.

(alter the time steps accordingly..)
