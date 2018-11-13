Hcalculator = [X1add, Y1add, 1, 0, 0, 0, -X1add*X1base, -Y1add*X1base;
                0, 0, 0, X1add, Y1add, 1, -X1add*Y1base, -Y1add*Y1base;
                X2add, Y2add, 1, 0, 0, 0, -X2add*X2base, -Y2add*X2base;
                0, 0, 0, X2add, Y2add, 1, -X2add*Y2base, -Y2add*Y2base;
                X3add, Y3add, 1, 0, 0, 0, -X3add*X3base, -Y3add*X3base;
                0, 0, 0, X3add, Y3add, 1, -X3add*Y3base, -Y3add*Y3base;
                X4add, Y4add, 1, 0, 0, 0, -X4add*X4base, -Y4add*X4base;
                0, 0, 0, X4add, Y4add, 1, -X4add*Y4base, -Y4add*Y4base];

Xbase = [X1base; Y1base; X2base; Y2base; X3base; Y3base; X4base; Y4base];

Hcolumn = Hcalculator \ Xbase;
H = [Hcolumn(1), Hcolumn(2), Hcolumn(3);
    Hcolumn(4), Hcolumn(5), Hcolumn(6);
    Hcolumn(7), Hcolumn(8), 1];