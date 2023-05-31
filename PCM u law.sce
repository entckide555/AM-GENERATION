clc ;
function [Cx, Xmax]=Alaw(x, A)
Xmax = max(abs(x));
for i = 1:length(x)
if(x(i)/Xmax<=1/A)
Cx(i) = A*abs(x(i)/Xmax)./(1+log(A));
elseif(x(i)/Xmax >1/A)
Cx(i) = (1+log(A*abs(x(i)/Xmax)))./(1+log(A));
end
end
Cx = Cx / Xmax ;
Cx = Cx';
endfunction
x = 0:0.01:1; // Normalized input
A = [1 ,2 ,87.56]; // Different Values of A
for i = 1:length(A)
[Cx(i,:),Xmax(i)] = Alaw (x,A(i));
end
plot2d (x/Xmax(1),Cx(1,:),2)
plot2d (x/Xmax(2),Cx(2,:),4)
plot2d (x/Xmax(3),Cx(3,:),6)
xtitle ('Compression Law: A-Law companding&#39;,&#39;Normalized Input |x|&#39;,&#39;Normalized Outpu|c(x)|');
legend (['A=1'],['A=2'],['A=87.56'])
