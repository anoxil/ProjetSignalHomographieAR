Ibase=read(Vbase,Iindex);
Iadd=read(Vadd,Iindex);

rangx = ((Iindex-1)*2)+1;
rangy = ((Iindex-1)*2)+2;

X1base = C(rangx,1);
Y1base = C(rangy,1);
X2base = C(rangx,2);
Y2base = C(rangy,2);
X3base = C(rangx,3);
Y3base = C(rangy,3);
X4base = C(rangx,4);
Y4base = C(rangy,4);


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