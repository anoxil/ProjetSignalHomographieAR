Ibase=read(Vbase,Iindex);
Iadd=read(Vadd,Iindex);

X1base = C(Iindex,1);
Y1base = C(Iindex+1,1);
X2base = C(Iindex,2);
Y2base = C(Iindex+1,2);
X3base = C(Iindex,3);
Y3base = C(Iindex+1,3);
X4base = C(Iindex,4);
Y4base = C(Iindex+1,4);

% X1base = 683.7500;
% Y1base = 412.2500;
% X2base = fix(1.3363e+03);
% Y2base = fix(233.7500);
% X3base = 629.7500;
% Y3base = 764.7500;
% X4base = fix(1.4278e+03);
% Y4base = fix(581.7500);

data_Vadd=get(Vadd);
Wadd = data_Vadd.Width;
Hadd = data_Vadd.Height;
X1add = 0;
Y1add = 0;
X2add = Wadd;
Y2add = 0;
X3add = 0;
Y3add = Hadd;
X4add = Wadd;
Y4add = Hadd;

Xadd_seuil = fix(X2add - ((X2add - X1add)/4));