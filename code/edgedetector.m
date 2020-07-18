
function [edge] = edgedetector(input_img)

img = double(input_img);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

[Rx,Ry] = gradient(R);
[Gx,Gy] = gradient(G);
[Bx,By] = gradient(B);

% Sx = sqrt(Rx.^2+Gx.^2+Bx.^2);
% Sy = sqrt( Ry.^2+Gy.^2+By.^2);
% Sxy = sqrt(Rx.*Ry+Gx.*Gy+Bx.*By);

Sx = Rx.^2+Gx.^2+Bx.^2;
Sy = Ry.^2+Gy.^2+By.^2;
Sxy = Rx.*Ry+Gx.*Gy+Bx.*By;


D = sqrt(abs((Sx+Sy).^2-4*(1)*(Sx.*Sy-Sxy.^2))); % Discriminant of the Characteristic Equation of Image structure matrix
eigVal1 = sqrt((Sx+Sy+D)/2);  % Solutions of Characteristic Equation are the Eigen Values
% eigVal2 = (Sx+Sy-D)/2;  

edge  = eigVal1;

end