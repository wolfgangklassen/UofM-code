function B = calcBfieldDipole(m,r,R)
%calcBfieldDipole generates the magnetic field at some point R associated
%with a dipole located at r posessing moment m.  These are all
%3-dimensional vectors.  This returns the magnetic field vector at the
%position R.  !!IMPORTANT!!: Unlike the bfield calculation that uses the
%transformation matrix, this equation must be done in SI units

B = (1/4.*pi).*(3*((dot(m,(R-r))*(R-r))./(norm(R-r))^5)-(m./(norm(R-r))^3));

end