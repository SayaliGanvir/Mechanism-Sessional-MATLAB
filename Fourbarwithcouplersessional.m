
%% Input Parameters
%Link Lengths, Initial position angle and Coupler angle
clc; clear; close all;
format SHORTG
a=50;                        %Crank 
e=a;                         %CouplerExtension
b=sqrt(2*e*e);               %Coupler Link
c=90;                        %Output Link
d=40;                        %fixed Link

alpha=45;                    %Coupler Extenstion Angle 
ar=alpha*pi/180;             %Degree to radian of Coupler Extenstion Angle
theta=120:1:270;             %Initial angle with limit of rotation 
T=theta*pi/180;              %Degree to radian of Initial angle
f=sqrt(a*a+d*d-2*a*d*cos(T)); 

%% Calculations 
%Angles and Coupler Curve Coordinates 
for i=1:length(theta) 
 %Calculation of Angles
G(i)=atan((a*sin(T(i)))/(d-a*cos(T(i))));
Bita(i)=acos((f(i).*f(1,i)+b*b-c*c)/(2*b*f(i)))-G(i);

%Coordinates 
X(i)=a*cos(T(i))+e*cos(ar+Bita(i));
Y(i)=a*sin(T(i))+e*sin(ar+Bita(i));


%% Section 3 :Plotting and Animation 
%Plotting of Fourbar and Coupler Curve with trace 
hold on;
title('FourBar Coupler Curve')
xlim([-80,120])
ylim([-80,120])
plot(X,Y,'b','Linewidth',1)

Trace= viscircles([X(i) Y(i)],2,'Color','k');

Cx=[0 a*cos(T(i)) b*cos(Bita(i))+a*cos(T(i)) d a*cos(T(i))+e*cos(Bita(i)+ar)];
Cy=[0 a*sin(T(i)) b*sin(Bita(i))+a*sin(T(i)) 0 a*sin(T(i))+e*sin(Bita(i)+ar)];

crank=line([0 Cx(2)],[0 Cy(2)],'color','r','linewidth',5);%link 1
coupler=line([Cx(2) Cx(3)],[Cy(2) Cy(3)],'color','g','linewidth',5);%link 2
output=line([Cx(3) d],[Cy(3) 0],'color','y','linewidth',5);%link 3
fix=line([0 d],[0 0],'color','k','linewidth',5);%link4
eline=line([Cx(2) Cx(5)],[Cy(2) Cy(5)],'color','c','linewidth',3);
eoline=line([Cx(5) Cx(3)],[Cy(5) Cy(3)],'color','c','linewidth',3);%link e joint

%Animation of Plotting by Deleting the previous plotting 
pause(0.005)
delete(crank)
delete(coupler)
delete(output)
delete(eline)
delete(eoline)
delete(Trace)
end
%% Back to Initial Position 
crank=line([0 Cx(2)],[0 Cy(2)],'color','r','linewidth',5);%link 1
coupler=line([Cx(2) Cx(3)],[Cy(2) Cy(3)],'color','g','linewidth',5);%link 2
output=line([Cx(3) d],[Cy(3) 0],'color','y','linewidth',5);%link 3
fix=line([0 d],[0 0],'color','k','linewidth',5);%link4
eline=line([Cx(2) Cx(5)],[Cy(2) Cy(5)],'color','c','linewidth',3);
eoline=line([Cx(5) Cx(3)],[Cy(5) Cy(3)],'color','c','linewidth',3);%link e joint
 