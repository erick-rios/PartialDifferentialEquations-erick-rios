% TAREA
%                       ONDAS TÉRMICAS

% Una onda térmica es la respuesta de un medio a una fuente de 
% calentamiento periódico (Figura). Cuando una fuente de energía 
% incide sobre la superficie de un sólido opaco, el sólido absorberá
% parte de esta energía y producirá un flujo localizado de calor. Si la
% fuente de calor es modulada, un flujo periódico es producido por la 
% muestra. El resultado de este flujo de calor se llama onda térmica. 
% Las ondas térmicas pueden ser producidas en el interior de un material
% que haya absorbido energía. Estas ondas interactuarán con las 
% características térmica de un material de una manera análoga como la
% luz interacciona con las características ópticas en los procesos de 
% dispersión, reflexión y refracción en las interfaces. De está manera
% las ondas térmicas pueden ser usadas para la evaluación y mapeo de 
% materiales.
%
% Encontrar la solucion numerica con el método explicito del problema
%
%       Ut - alfa*Uxx = 0      con  alfa =1
%       U(x,0) = 2*x        si 0<=x<=1/2
%                2 - 2*x    si 1/2<x<=1
%       U(0,t) = A*sin(2*w*t); U(1,t) = A*cos( w/2 * t)
%
% usando A=1,2  y w=100 . Ademas
%      (i) J   = 40; dt  = 0.00031; alfa = 1.0
%     (ii) J   = 40; dt  = 0.00031; alfa = 2.0
%    (iii) J   = 40; dt  = 0.00031; alfa = 0.5
%     (iv) J   = 50; dt  = 0.00031; alfa = 1.0
%      (v) J   = 50; dt  = 0.00031; alfa = 2.0
%     (vi) J   = 50; dt  = 0.00031; alfa = 0.5
%
% Escriba sus conclusiones de la practica
%

%-------------------------------------
% Definition of parameters
%--------------------------------------

%initialTime: double
%             the initial time
initalTime          = 0.0;
%finalTime: double
%           the final time
finalTime           = 0.15;

%J is the value of the last partition of  X
J                   = 50;

%parameter dx: float
%   The diferential in x
differentialOfX     = 1.0/J;  

%parameter dt: float
%   The diferential in t
differentialOfTime  = 0.0001;
%dt=0.0020

N                   = round(finalTime/differentialOfTime)
mu                  = differentialOfTime/(differentialOfX)^2

%--------------------------
% Initial Conditions
%--------------------------

x = 0 : differentialOfX : 1;
U0(1:J/2+1)   = 2.0*x(1:J/2+1);
U0(J/2+2:J+1) = 2.0 - 2.0*x(J/2+2:J+1);
figure(1)
plot(x,U0,'b-*')
   xlabel('x','FontSize',12);
   ylabel('U','FontSize',12,'VerticalAlignment','bottom');
    title('Initial time **t = 0**');

disp('Press any key to continue'); pause
clc ; echo off 

%-----------------------------
% Iterative Algorithm
%-----------------------------

%Definiton of parameters to generate the loop
time        = initalTime;
A           = 1.0;
w           = 100.0;
alpha       = 1.0;

%Begins the loop
while(time<tf)
  % Boundary Conditions
  U1(1)     = A * sin((2*w) * time);
  U1(J+1)   =   A *cos( (w/2) * time);
   for j=2:J
      U1(j)  = U0(j) + mu*(alpha*(U0(j+1)-2*U0(j)+U0(j-1)));
   end     
  % Gráfica de resultados al tiempo t
   figure(2)
   plot(x,U1,'b-*');
   axis([0 1 0 1]);  
   axis(axis);
   xlabel('x','FontSize',12);
   ylabel('U','FontSize',12,'VerticalAlignment','bottom');
   title(sprintf('time = %f',time));
   pause(0.30);
  %Avanzar al siguiente paso de tiempo
   time    = time + differentialOfTime;
   U0 = U1;
end

echo off 
