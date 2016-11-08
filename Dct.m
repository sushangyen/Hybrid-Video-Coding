function   dct = Dct(image)

DCT = zeros(288,352);
cf = [1,1,1,1;2,1,-1,-2;1,-1,-1,1;1,-2,2,-1];
cft = [1,2,1,1;1,1,-1,-2;1,-1,-1,2;1,-2,1,-1];
for a = 1:72
    for b = 1:88
        X = [image(4*a-3,4*b-3),image(4*a-3,4*b-2),image(4*a-3,4*b-1),image(4*a-3,4*b);
             image(4*a-2,4*b-3),image(4*a-2,4*b-2),image(4*a-2,4*b-1),image(4*a-2,4*b);
             image(4*a-1,4*b-3),image(4*a-1,4*b-2),image(4*a-1,4*b-1),image(4*a-1,4*b);
             image(4*a,4*b-3),image(4*a,4*b-2),image(4*a,4*b-1),image(4*a,4*b)];
        temp= cf*X*cft;
        DCT(4*a-3,4*b-3) = temp(1,1)*0.25;
        DCT(4*a-3,4*b-2) = temp(1,2)*0.158;
        DCT(4*a-3,4*b-1) = temp(1,3)*0.25;
        DCT(4*a-3,4*b) = temp(1,4)*0.158;
        DCT(4*a-2,4*b-3) = temp(2,1)*0.158;
        DCT(4*a-2,4*b-2) = temp(2,2)*0.1;
        DCT(4*a-2,4*b-1) = temp(2,3)*0.158;
        DCT(4*a-2,4*b) = temp(2,4)*0.1;
        DCT(4*a-1,4*b-3) = temp(3,1)*0.25;
        DCT(4*a-1,4*b-2) = temp(3,2)*0.158;
        DCT(4*a-1,4*b-1) = temp(3,3)*0.25;
        DCT(4*a-1,4*b) = temp(3,4)*0.158;
        DCT(4*a,4*b-3) = temp(4,1)*0.158;
        DCT(4*a,4*b-2) = temp(4,2)*0.1;
        DCT(4*a,4*b-1) = temp(4,3)*0.158;
        DCT(4*a,4*b) = temp(4,4)*0.1;
    end
end
inverse_DCT = zeros(288,352);
cit = [1,1,1,0.5;1,0.5,-1,-1;1,-0.5,-1,1;1,-1,1,-0.5];
ci = [1,1,1,1;1,0.5,-0.5,-1;1,-1,-1,1;0.5,-1,1,-0.5];
for a = 1:72
    for b = 1:88
        Y = [DCT(4*a-3,4*b-3)*0.25,DCT(4*a-3,4*b-2)*0.316,DCT(4*a-3,4*b-1)*0.25,DCT(4*a-3,4*b)*0.316;
            DCT(4*a-2,4*b-3)*0.316,DCT(4*a-2,4*b-2)*0.4,DCT(4*a-2,4*b-1)*0.316,DCT(4*a-2,4*b)*0.4;
             DCT(4*a-1,4*b-3)*0.25,DCT(4*a-1,4*b-2)*0.316,DCT(4*a-1,4*b-1)*0.25,DCT(4*a-1,4*b)*0.316;
             DCT(4*a,4*b-3)*0.316,DCT(4*a,4*b-2)*0.4,DCT(4*a,4*b-1)*0.316,DCT(4*a,4*b)*0.4];
        temp= cit*Y*ci;
        inverse_DCT(4*a-3,4*b-3) = temp(1,1);
        inverse_DCT(4*a-3,4*b-2) = temp(1,2);
        inverse_DCT(4*a-3,4*b-1) = temp(1,3);
        inverse_DCT(4*a-3,4*b) = temp(1,4);
        inverse_DCT(4*a-2,4*b-3) = temp(2,1);
        inverse_DCT(4*a-2,4*b-2) = temp(2,2);
        inverse_DCT(4*a-2,4*b-1) = temp(2,3);
        inverse_DCT(4*a-2,4*b) = temp(2,4);
        inverse_DCT(4*a-1,4*b-3) = temp(3,1);
        inverse_DCT(4*a-1,4*b-2) = temp(3,2);
        inverse_DCT(4*a-1,4*b-1) = temp(3,3);
        inverse_DCT(4*a-1,4*b) = temp(3,4);
        inverse_DCT(4*a,4*b-3) = temp(4,1);
        inverse_DCT(4*a,4*b-2) = temp(4,2);
        inverse_DCT(4*a,4*b-1) = temp(4,3);
        inverse_DCT(4*a,4*b) = temp(4,4);
    end
end


%Qunatize
W = zeros(288,352);
cf = [1,1,1,1;2,1,-1,-2;1,-1,-1,1;1,-2,2,-1];
cft = [1,2,1,1;1,1,-1,-2;1,-1,-1,2;1,-2,1,-1];
for a = 1:72
    for b = 1:88
        X = [inverse_DCT(4*a-3,4*b-3),inverse_DCT(4*a-3,4*b-2),inverse_DCT(4*a-3,4*b-1),inverse_DCT(4*a-3,4*b);
             inverse_DCT(4*a-2,4*b-3),inverse_DCT(4*a-2,4*b-2),inverse_DCT(4*a-2,4*b-1),inverse_DCT(4*a-2,4*b);
             inverse_DCT(4*a-1,4*b-3),inverse_DCT(4*a-1,4*b-2),inverse_DCT(4*a-1,4*b-1),inverse_DCT(4*a-1,4*b);
             inverse_DCT(4*a,4*b-3),inverse_DCT(4*a,4*b-2),inverse_DCT(4*a,4*b-1),inverse_DCT(4*a,4*b)];
        temp= cf*X*cft;
        W(4*a-3,4*b-3) = round(temp(1,1)*0.25/1.625);
        W(4*a-3,4*b-2) = round(temp(1,2)*0.158/1.625);
        W(4*a-3,4*b-1) = round(temp(1,3)*0.25/1.625);
        W(4*a-3,4*b) = round(temp(1,4)*0.158/1.625);
        W(4*a-2,4*b-3) = round(temp(2,1)*0.158/1.625);
        W(4*a-2,4*b-2) = round(temp(2,2)*0.1/1.625);
        W(4*a-2,4*b-1) = round(temp(2,3)*0.158/1.625);
        W(4*a-2,4*b) = round(temp(2,4)*0.1/1.625);
        W(4*a-1,4*b-3) = round(temp(3,1)*0.25/1.625);
        W(4*a-1,4*b-2) = round(temp(3,2)*0.158/1.625);
        W(4*a-1,4*b-1) = round(temp(3,3)*0.25/1.625);
        W(4*a-1,4*b) = round(temp(3,4)*0.158/1.625);
        W(4*a,4*b-3) = round(temp(4,1)*0.158/1.625);
        W(4*a,4*b-2) = round(temp(4,2)*0.1/1.625);
        W(4*a,4*b-1) = round(temp(4,3)*0.158/1.625);
        W(4*a,4*b) = round(temp(4,4)*0.1/1.625);
    end
end
%Inverse quantize
inverse_W = zeros(288,352);
for a = 1:72
    for b = 1:88
        Y = [W(4*a-3,4*b-3)*0.25*1.625*64,W(4*a-3,4*b-2)*0.316*1.625*64,W(4*a-3,4*b-1)*0.25*1.625*64,W(4*a-3,4*b)*0.316*1.625*64;
             W(4*a-2,4*b-3)*0.316*1.625*64,W(4*a-2,4*b-2)*0.4*1.625*64,W(4*a-2,4*b-1)*0.316*1.625*64,W(4*a-2,4*b)*0.4*1.625*64;
             W(4*a-1,4*b-3)*0.25*1.625*64,W(4*a-1,4*b-2)*0.316*1.625*64,W(4*a-1,4*b-1)*0.25*1.625*64,W(4*a-1,4*b)*0.316*1.625*64;
             W(4*a,4*b-3)*0.316*1.625*64,W(4*a,4*b-2)*0.4*1.625*64,W(4*a,4*b-1)*0.316*1.625*64,W(4*a,4*b)*0.4*1.625*64];
        Y = cit*Y*ci;
        inverse_W(4*a-3,4*b-3) = Y(1,1)/64;
        inverse_W(4*a-3,4*b-2) = Y(1,2)/64;
        inverse_W(4*a-3,4*b-1) = Y(1,3)/64;
        inverse_W(4*a-3,4*b) = Y(1,4)/64;
        inverse_W(4*a-2,4*b-3) = Y(2,1)/64;
        inverse_W(4*a-2,4*b-2) = Y(2,2)/64;
        inverse_W(4*a-2,4*b-1) = Y(2,3)/64;
        inverse_W(4*a-2,4*b) = Y(2,4)/64;
        inverse_W(4*a-1,4*b-3) = Y(3,1)/64;
        inverse_W(4*a-1,4*b-2) = Y(3,2)/64;
        inverse_W(4*a-1,4*b-1) = Y(3,3)/64;
        inverse_W(4*a-1,4*b) = Y(3,4)/64;
        inverse_W(4*a,4*b-3) = Y(4,1)/64;
        inverse_W(4*a,4*b-2) = Y(4,2)/64;
        inverse_W(4*a,4*b-1) = Y(4,3)/64;
        inverse_W(4*a,4*b) = Y(4,4)/64;
    end
end

dct = inverse_W;
