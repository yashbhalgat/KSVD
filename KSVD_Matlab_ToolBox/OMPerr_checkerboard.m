function [A]=OMPerr_checkerboard(D,X,errorGoal, X_checker)
%=============================================
% Sparse coding of a group of signals based on a given 
% dictionary and specified number of atoms to use. 
% input arguments: D - the dictionary
%                  X - the signals to represent
%                  errorGoal - the maximal allowed representation error for
%                  each siganl.
% output arguments: A - sparse coefficient matrix.
%=============================================
[n,P]=size(X);
[n,K]=size(D);
E2 = errorGoal^2*n;
maxNumCoef = n/64;
A = sparse(size(D,2),size(X,2));
for k=1:1:P,
    a=[];
    x=X(:,k);
    xc=X_checker(:,k);
    xs = x(xc==1);
    dc = repmat(xc, [1 size(D, 2)]);
    Ds = D(dc==1);
    Ds = reshape(Ds, size(xs,1), size(D,2));
    residual=xs;
	indx = [];
	a = [];
	currResNorm2 = sum(residual.^2);
	j = 0;
    while currResNorm2>E2 & j < maxNumCoef,
		j = j+1;
        proj=Ds'*residual;
        pos=find(abs(proj)==max(abs(proj)));
        pos=pos(1);
        indx(j)=pos;
        a=pinv(Ds(:,indx(1:j)))*xs;
        residual=xs-Ds(:,indx(1:j))*a;
		currResNorm2 = sum(residual.^2);
   end;
   if (length(indx)>0)
       A(indx,k)=a;
   end
end;
return;
