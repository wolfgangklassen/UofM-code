function g = genGradRandom()
%generates a random gradient vector, with values large enough to have a
%1e-27 dFalse contribution.  Units are microtesla/cm^(ell), where ell is
%the degree of the polynomial associated with the gradient term.

%for this setup, values are as high as we expect them to be, given a
%maximum magnetic field variation over a meter inside the magnetic
%shielding to be <3nT.

g = transpose([1e-3*(2*rand - 1),1,(2*rand - 1)*1e-3,...  
(2*rand - 1)*3e-5,...%4
(2*rand - 1)*3e-5,(2*rand - 1)*3e-5,...%6
(2*rand - 1)*3e-5,(2*rand - 1)*3e-5,...%8
(2*rand - 1)*6e-7,(2*rand - 1)*6e-7,...%10
(2*rand - 1)*6e-7,(2*rand - 1)*6e-7,...%12
(2*rand - 1)*6e-7,(2*rand - 1)*6e-7,...%14
(2*rand - 1)*6e-7,...%15
(2*rand - 1)*6e-9,...%16
(2*rand - 1)*6e-9,(2*rand - 1)*6e-9,...%18
(2*rand - 1)*6e-9,(2*rand - 1)*6e-9,...%20
(2*rand - 1)*6e-9,(2*rand - 1)*6e-9,...%22
(2*rand - 1)*6e-9,(2*rand - 1)*6e-9,...%24%%%%%%%
(2*rand - 1)*9.5e-11,(2*rand - 1)*9.5e-11,...%26
(2*rand - 1)*9.5e-11,(2*rand - 1)*9.5e-11,...%28
(2*rand - 1)*9.5e-11,(2*rand - 1)*9.5e-11,...%30
(2*rand - 1)*9.5e-11,(2*rand - 1)*9.5e-11,...%32
(2*rand - 1)*9.5e-11,(2*rand - 1)*9.5e-11,...%34
(2*rand - 1)*9e-11,...%35
(2*rand - 1)*9e-13,(2*rand - 1)*9e-13,...%37
(2*rand - 1)*9e-13,(2*rand - 1)*9e-13,...%39
(2*rand - 1)*9e-13,(2*rand - 1)*9e-13,...%41
(2*rand - 1)*9e-13,(2*rand - 1)*9e-13,...%43
(2*rand - 1)*9e-13,(2*rand - 1)*9e-13,...%45
(2*rand - 1)*9e-13,(2*rand - 1)*9e-13,...%47
(2*rand - 1)*9e-13]);%48


end