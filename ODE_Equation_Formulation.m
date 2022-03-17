clc;
clear all;
close all;
%% 
m0 = 5;
m1 = 1;
m2 = 1;
L1 = 0.5;
L2 = 0.5;
g = 9.812;
theta1 = 0;
theta2 = 0;

d1 = m2+m1+m0;
d2 = (0.5*m1 + m2)*L1;
d3 = 0.5*m2*L2;
d4 = ((1/3)*m1 + m2)*(L1^2);
d5 = (1/2)*m2*L1*L2;
d6 = (1/3)*m2*(L2^2);

f1 = ((1/2)*m1 + m2)*L1*g;
f2 = (1/2)*m2*L2*g;
%% equations
syms theta1 theta1_dot theta2 theta2_dot theta0 theta0_dot theta0_Ddot theta1_Ddot theta2_Ddot
cxx = cos(theta1 - theta2);
cx1 = cos(theta1);
cx2 = cos(theta2);
sx1 = sin(theta1);
sx2 = sin(theta2);
sxx = sin(theta1 - theta2);

D_theta = [d1 d2*cx1 d3*cx2;
           d2*cx1 d4 d5*cxx;
           d3*cx2 d5*cxx d6;
           ];

C_theta_thetadot = [0 -d2*sx1*theta1_dot -d3*sx2*theta2_dot;
                    0 0 d5*sxx*theta2_dot;  
                    0 -d5*sxx*theta1_dot 0;];
G_theta = [0; -f1*sx1; -f2*sx2;]; 
H = [1;0;0];
%% Creating control Equations
Xs = [theta0; theta1; theta2; theta0_dot; theta1_dot; theta2_dot;];
I_D = inv(D_theta);

DC = -I_D*C_theta_thetadot;
DG = -I_D*G_theta;
DH =  I_D*H;


T1 = [ 0 0 0 1 0 0;
       0 0 0 0 1 0;
       0 0 0 0 0 1;
       0 0 0 DC(1,1) DC(1,2) DC(1,3);
       0 0 0 DC(2,1) DC(2,2) DC(2,3);
       0 0 0 DC(3,1) DC(3,2) DC(3,3);
];

T2 = [0;0;0;DG(1,1);DG(2,1);DG(3,1);];
T3 =  [0;0;0;DH(1,1);DH(2,1);DH(3,1);];

%%
%u = 1;
A1 = T1*Xs;
%A3 = T3*u;
%% Linearized Equation
%D_F = matlabFunction(I_D,'vars',[theta0 theta0_dot theta1 theta1_dot theta2 theta2_dot]);
f(theta0,theta0_dot, theta1, theta1_dot, theta2, theta2_dot) = I_D;
%f(theta0, theta1, theta2, theta0_dot, theta1_dot,theta2_dot) = I_D;
I_DV =  f(-1,0,pi,0,pi,0); %f(0,0,0,0,0,0);
dG = [0 0 0;0 -f1 0;0 0 -f2;];
A_I = double(I_DV*dG);
B_I = double(I_DV*H);

A = [0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     A_I(1,1)  A_I(1,2)  A_I(1,3) 0 0 0;
     A_I(2,1)  A_I(2,2)  A_I(2,3) 0 0 0;
     A_I(3,1)  A_I(3,2)  A_I(3,3) 0 0 0;
 ];
B = [0;0;0;B_I(1,1); B_I(2,1); B_I(3,1);];
%% Attempting Pole Placememt Feel Free to change any eigenvalues in the matrix K. Note, since the system is highly non linear, some values may not work
%eigs = [-.09;-20;-15;-2;-6;-7;]; % ucomment this line for Pole Placement Simulation and comment for LQR Method
%K = place(A,B,eigs) %% ucomment this line for Pole Placement Simulation and comment for LQR Method

%% Comment everything underneath this section for Pole Placement and uncomment for LQR
Q = [200 0 0 0 0 0;
     0 200 0 0 0 0;
     0 0 200 0 0 0;
     0 0 0 30 0 0;
     0 0 0 0 30 0;
     0 0 0 0 0 30];
R = .0010;

K = lqr(A,B,Q,R);
%%
simpend()