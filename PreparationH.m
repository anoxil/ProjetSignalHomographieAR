Hcalculator = [ajout_x1, ajout_y1, 1, 0, 0, 0, -ajout_x1*base_x1, -ajout_y1*base_x1;
                0, 0, 0, ajout_x1, ajout_y1, 1, -ajout_x1*base_y1, -ajout_y1*base_y1;
                ajout_x2, ajout_y2, 1, 0, 0, 0, -ajout_x2*base_x2, -ajout_y2*base_x2;
                0, 0, 0, ajout_x2, ajout_y2, 1, -ajout_x2*base_y2, -ajout_y2*base_y2;
                ajout_x3, ajout_y3, 1, 0, 0, 0, -ajout_x3*base_x3, -ajout_y3*base_x3;
                0, 0, 0, ajout_x3, ajout_y3, 1, -ajout_x3*base_y3, -ajout_y3*base_y3;
                ajout_x4, ajout_y4, 1, 0, 0, 0, -ajout_x4*base_x4, -ajout_y4*base_x4;
                0, 0, 0, ajout_x4, ajout_y4, 1, -ajout_x4*base_y4, -ajout_y4*base_y4];

Xbase = [base_x1; base_y1; base_x2; base_y2; base_x3; base_y3; base_x4; base_y4];

Hcolumn = Hcalculator \ Xbase;
H = [Hcolumn(1), Hcolumn(2), Hcolumn(3);
    Hcolumn(4), Hcolumn(5), Hcolumn(6);
    Hcolumn(7), Hcolumn(8), 1];