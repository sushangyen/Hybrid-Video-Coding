openv = fopen('/Users/su830304/Desktop/Others/University/Year IV Sem A/Video Coding/mini_project/foreman_420.yuv');

for frame = 1:10
    y = fread(openv, [352 288], 'uchar');
    u = fread(openv, [176 144], 'uchar');
    v = fread(openv, [176 144], 'uchar');
    Yseq(:,:,frame) = y';
    Useq(:,:,frame) = u';
    Vseq(:,:,frame) = v';
end
foreman00 = Yseq(:,:,1);
foreman00_block = zeros(4,4,6336);
i = 1;
for a = 1:72
    for b = 1:88
        foreman00_block(1,1,i) = foreman00(4*a-3,4*b-3);
        foreman00_block(1,2,i) = foreman00(4*a-3,4*b-2);
        foreman00_block(1,3,i) = foreman00(4*a-3,4*b-1);
        foreman00_block(1,4,i) = foreman00(4*a-3,4*b);
        foreman00_block(2,1,i) = foreman00(4*a-2,4*b-3);
        foreman00_block(2,2,i) = foreman00(4*a-2,4*b-2);
        foreman00_block(2,3,i) = foreman00(4*a-2,4*b-1);
        foreman00_block(2,4,i) = foreman00(4*a-2,4*b);
        foreman00_block(3,1,i) = foreman00(4*a-1,4*b-3);
        foreman00_block(3,2,i) = foreman00(4*a-1,4*b-2);
        foreman00_block(3,3,i) = foreman00(4*a-1,4*b-1);
        foreman00_block(3,4,i) = foreman00(4*a-1,4*b);
        foreman00_block(4,1,i) = foreman00(4*a,4*b-3);
        foreman00_block(4,2,i) = foreman00(4*a,4*b-2);
        foreman00_block(4,3,i) = foreman00(4*a,4*b-1);
        foreman00_block(4,4,i) = foreman00(4*a,4*b);
        i = i + 1;
    end
end

%----------------------Section 1.1-------------------------%
%vertical
intra_vert = zeros(288,352);
for a = 1:72
    for b = 1:352
        intra_vert(4*a-3,b) = foreman00(4*a-3,b);
        intra_vert(4*a-2,b) = foreman00(4*a-3,b);
        intra_vert(4*a-1,b) = foreman00(4*a-3,b);
        intra_vert(4*a,b) = foreman00(4*a-3,b);
    end    
end
intra_vert_block = zeros(4,4,6336);
i = 1;
for a = 1:72
    for b = 1:88
        intra_vert_block(1,1,i) = intra_vert(4*a-3,4*b-3);
        intra_vert_block(1,2,i) = intra_vert(4*a-3,4*b-2);
        intra_vert_block(1,3,i) = intra_vert(4*a-3,4*b-1);
        intra_vert_block(1,4,i) = intra_vert(4*a-3,4*b);
        intra_vert_block(2,1,i) = intra_vert(4*a-2,4*b-3);
        intra_vert_block(2,2,i) = intra_vert(4*a-2,4*b-2);
        intra_vert_block(2,3,i) = intra_vert(4*a-2,4*b-1);
        intra_vert_block(2,4,i) = intra_vert(4*a-2,4*b);
        intra_vert_block(3,1,i) = intra_vert(4*a-1,4*b-3);
        intra_vert_block(3,2,i) = intra_vert(4*a-1,4*b-2);
        intra_vert_block(3,3,i) = intra_vert(4*a-1,4*b-1);
        intra_vert_block(3,4,i) = intra_vert(4*a-1,4*b);
        intra_vert_block(4,1,i) = intra_vert(4*a,4*b-3);
        intra_vert_block(4,2,i) = intra_vert(4*a,4*b-2);
        intra_vert_block(4,3,i) = intra_vert(4*a,4*b-1);
        intra_vert_block(4,4,i) = intra_vert(4*a,4*b);
        i = i + 1;
    end
end
%horizontal
intra_horiz = zeros(288,352);
for a = 1:288
    for b = 1:88
        intra_horiz(a,4*b-3) = foreman00(a,4*b-3);
        intra_horiz(a,4*b-2) = foreman00(a,4*b-3);
        intra_horiz(a,4*b-1) = foreman00(a,4*b-3);
        intra_horiz(a,4*b) = foreman00(a,4*b-3);
    end
end
intra_horiz_block = zeros(4,4,6336);
i = 1;
for a = 1:72
    for b = 1:88
        intra_horiz_block(1,1,i) = intra_horiz(4*a-3,4*b-3);
        intra_horiz_block(1,2,i) = intra_horiz(4*a-3,4*b-2);
        intra_horiz_block(1,3,i) = intra_horiz(4*a-3,4*b-1);
        intra_horiz_block(1,4,i) = intra_horiz(4*a-3,4*b);
        intra_horiz_block(2,1,i) = intra_horiz(4*a-2,4*b-3);
        intra_horiz_block(2,2,i) = intra_horiz(4*a-2,4*b-2);
        intra_horiz_block(2,3,i) = intra_horiz(4*a-2,4*b-1);
        intra_horiz_block(2,4,i) = intra_horiz(4*a-2,4*b);
        intra_horiz_block(3,1,i) = intra_horiz(4*a-1,4*b-3);
        intra_horiz_block(3,2,i) = intra_horiz(4*a-1,4*b-2);
        intra_horiz_block(3,3,i) = intra_horiz(4*a-1,4*b-1);
        intra_horiz_block(3,4,i) = intra_horiz(4*a-1,4*b);
        intra_horiz_block(4,1,i) = intra_horiz(4*a,4*b-3);
        intra_horiz_block(4,2,i) = intra_horiz(4*a,4*b-2);
        intra_horiz_block(4,3,i) = intra_horiz(4*a,4*b-1);
        intra_horiz_block(4,4,i) = intra_horiz(4*a,4*b);
        i = i + 1;
    end
end
%DC
intra_DC = zeros(288,352);
DC_mean = 0;
for a = 1:72
    for b = 1:88
       DC_mean = (foreman00(4*a,4*b)+foreman00(4*a-3,4*b) +foreman00(4*a,4*b-3) +foreman00(4*a-3,4*b-3))/4;
       for x = 0:3
           for y = 0:3 
                intra_DC(4*a-x,4*b-y) = DC_mean;  
           end
       end
    end
end
intra_DC_block = zeros(4,4,6336);
i = 1;
for a = 1:72
    for b = 1:88
        intra_DC_block(1,1,i) = intra_DC(4*a-3,4*b-3);
        intra_DC_block(1,2,i) = intra_DC(4*a-3,4*b-2);
        intra_DC_block(1,3,i) = intra_DC(4*a-3,4*b-1);
        intra_DC_block(1,4,i) = intra_DC(4*a-3,4*b);
        intra_DC_block(2,1,i) = intra_DC(4*a-2,4*b-3);
        intra_DC_block(2,2,i) = intra_DC(4*a-2,4*b-2);
        intra_DC_block(2,3,i) = intra_DC(4*a-2,4*b-1);
        intra_DC_block(2,4,i) = intra_DC(4*a-2,4*b);
        intra_DC_block(3,1,i) = intra_DC(4*a-1,4*b-3);
        intra_DC_block(3,2,i) = intra_DC(4*a-1,4*b-2);
        intra_DC_block(3,3,i) = intra_DC(4*a-1,4*b-1);
        intra_DC_block(3,4,i) = intra_DC(4*a-1,4*b);
        intra_DC_block(4,1,i) = intra_DC(4*a,4*b-3);
        intra_DC_block(4,2,i) = intra_DC(4*a,4*b-2);
        intra_DC_block(4,3,i) = intra_DC(4*a,4*b-1);
        intra_DC_block(4,4,i) = intra_DC(4*a,4*b);
        i = i + 1;
    end
end
%diagonal down-left
intra_down_left = foreman00;
for a = 1:72
    for b = 1:348
        intra_down_left(4*a-2,b) = foreman00(4*a-3,b+1);
        intra_down_left(4*a-1,b) = foreman00(4*a-3,b+2);
        intra_down_left(4*a,b) = foreman00(4*a-3,b+3);
    end
end
for a = 1:72
    intra_down_left(4*a-2,351) = foreman00(4*a-3,352);
    intra_down_left(4*a-1,350) = foreman00(4*a-3,352);
    intra_down_left(4*a,349) = foreman00(4*a-3,352);
    intra_down_left(4*a-2,350) = foreman00(4*a-3,351);
    intra_down_left(4*a-1,349) = foreman00(4*a-3,351);
    intra_down_left(4*a-2,349) = foreman00(4*a-3,350);
    intra_down_left(4*a-1,351) = foreman00(4*a-2,352);
    intra_down_left(4*a,350) = foreman00(4*a-2,352);
    intra_down_left(4*a,351) = foreman00(4*a-1,352);
end
intra_down_left_block = zeros(4,4,6336);
i = 1;
for a = 1:72
    for b = 1:88
        intra_down_left_block(1,1,i) = intra_down_left(4*a-3,4*b-3);
        intra_down_left_block(1,2,i) = intra_down_left(4*a-3,4*b-2);
        intra_down_left_block(1,3,i) = intra_down_left(4*a-3,4*b-1);
        intra_down_left_block(1,4,i) = intra_down_left(4*a-3,4*b);
        intra_down_left_block(2,1,i) = intra_down_left(4*a-2,4*b-3);
        intra_down_left_block(2,2,i) = intra_down_left(4*a-2,4*b-2);
        intra_down_left_block(2,3,i) = intra_down_left(4*a-2,4*b-1);
        intra_down_left_block(2,4,i) = intra_down_left(4*a-2,4*b);
        intra_down_left_block(3,1,i) = intra_down_left(4*a-1,4*b-3);
        intra_down_left_block(3,2,i) = intra_down_left(4*a-1,4*b-2);
        intra_down_left_block(3,3,i) = intra_down_left(4*a-1,4*b-1);
        intra_down_left_block(3,4,i) = intra_down_left(4*a-1,4*b);
        intra_down_left_block(4,1,i) = intra_down_left(4*a,4*b-3);
        intra_down_left_block(4,2,i) = intra_down_left(4*a,4*b-2);
        intra_down_left_block(4,3,i) = intra_down_left(4*a,4*b-1);
        intra_down_left_block(4,4,i) = intra_down_left(4*a,4*b);
        i = i + 1;
    end
end
%diagonal down-right
intra_down_right = foreman00;
for a = 1:72
    for b = 5:352
        intra_down_right(4*a-2,b) = foreman00(4*a-3,b-1);
        intra_down_right(4*a-1,b) = foreman00(4*a-3,b-2);
        intra_down_right(4*a,b) = foreman00(4*a-3,b-3);
    end
end
for a = 1:72
    intra_down_right(4*a-2,2) = foreman00(4*a-3,1);
    intra_down_right(4*a-1,3) = foreman00(4*a-3,1);
    intra_down_right(4*a,4) = foreman00(4*a-3,1);
    intra_down_right(4*a-1,2) = foreman00(4*a-2,1);
    intra_down_right(4*a,3) = foreman00(4*a-2,1);
    intra_down_right(4*a,2) = foreman00(4*a-1,1);
    intra_down_right(4*a-2,3) = foreman00(4*a-3,2);
    intra_down_right(4*a-2,4) = foreman00(4*a-3,3);
    intra_down_right(4*a-1,4) = foreman00(4*a-3,2);
end
intra_down_right_block = zeros(4,4,6336);
i = 1;
for a = 1:72
    for b = 1:88
        intra_down_right_block(1,1,i) = intra_down_right(4*a-3,4*b-3);
        intra_down_right_block(1,2,i) = intra_down_right(4*a-3,4*b-2);
        intra_down_right_block(1,3,i) = intra_down_right(4*a-3,4*b-1);
        intra_down_right_block(1,4,i) = intra_down_right(4*a-3,4*b);
        intra_down_right_block(2,1,i) = intra_down_right(4*a-2,4*b-3);
        intra_down_right_block(2,2,i) = intra_down_right(4*a-2,4*b-2);
        intra_down_right_block(2,3,i) = intra_down_right(4*a-2,4*b-1);
        intra_down_right_block(2,4,i) = intra_down_right(4*a-2,4*b);
        intra_down_right_block(3,1,i) = intra_down_right(4*a-1,4*b-3);
        intra_down_right_block(3,2,i) = intra_down_right(4*a-1,4*b-2);
        intra_down_right_block(3,3,i) = intra_down_right(4*a-1,4*b-1);
        intra_down_right_block(3,4,i) = intra_down_right(4*a-1,4*b);
        intra_down_right_block(4,1,i) = intra_down_right(4*a,4*b-3);
        intra_down_right_block(4,2,i) = intra_down_right(4*a,4*b-2);
        intra_down_right_block(4,3,i) = intra_down_right(4*a,4*b-1);
        intra_down_right_block(4,4,i) = intra_down_right(4*a,4*b);
        i = i + 1;
    end
end

final = zeros(4,4,6336);
number_mode = zeros(1,5);
for i = 1:6336
       temp = 1000;
       mode = 0;
       SAD = zeros(1,5);
       diffBlock1 = foreman00_block(:,:,i) - intra_vert_block(:,:,i);
       SAD(1,1) = sum(abs(diffBlock1(:)));
       diffBlock2 = foreman00_block(:,:,i) - intra_horiz_block(:,:,i);
       SAD(1,2) = sum(abs(diffBlock2(:)));
       diffBlock3 = foreman00_block(:,:,i) - intra_DC_block(:,:,i);
       SAD(1,3) = sum(abs(diffBlock3(:)));
       diffBlock4 = foreman00_block(:,:,i) - intra_down_left_block(:,:,i);
       SAD(1,4) = sum(abs(diffBlock4(:)));
       diffBlock5 = foreman00_block(:,:,i) - intra_down_right_block(:,:,i);
       SAD(1,5) = sum(abs(diffBlock5(:)));
       for a = 1:5
        if SAD(1,a) < temp
            temp = SAD(1,a);
            mode = a;
        end
       end
       if mode == 1
            final(:,:,i) = intra_vert_block(:,:,i);
            number_mode(1,1) = number_mode(1,1) + 1; 
       end
       if mode == 2
            final(:,:,i) = intra_horiz_block(:,:,i);
            number_mode(1,2) = number_mode(1,2) + 1; 
       end
       if mode == 3
            final(:,:,i) = intra_DC_block(:,:,i);
            number_mode(1,3) = number_mode(1,3) + 1; 
       end
       if mode == 4
            final(:,:,i) = intra_down_left_block(:,:,i);
            number_mode(1,4) = number_mode(1,4) + 1; 
       end
       if mode == 5
            final(:,:,i) = intra_down_right_block(:,:,i);
            number_mode(1,5) = number_mode(1,5) + 1; 
       end
end

final_foreman00 = zeros(288,352);
i = 1;
for a = 1:72
    for b = 1:88
        final_foreman00(4*a-3,4*b-3) = final(1,1,i);
        final_foreman00(4*a-3,4*b-2) = final(1,2,i);
        final_foreman00(4*a-3,4*b-1) = final(1,3,i);
        final_foreman00(4*a-3,4*b) = final(1,4,i);
        final_foreman00(4*a-2,4*b-3) = final(2,1,i);
        final_foreman00(4*a-2,4*b-2) = final(2,2,i);
        final_foreman00(4*a-2,4*b-1) = final(2,3,i);
        final_foreman00(4*a-2,4*b) = final(2,4,i);
        final_foreman00(4*a-1,4*b-3) = final(3,1,i);
        final_foreman00(4*a-1,4*b-2) = final(3,2,i);
        final_foreman00(4*a-1,4*b-1) = final(3,3,i);
        final_foreman00(4*a-1,4*b) = final(3,4,i);
        final_foreman00(4*a,4*b-3) = final(4,1,i);
        final_foreman00(4*a,4*b-2) = final(4,2,i);
        final_foreman00(4*a,4*b-1) = final(4,3,i);
        final_foreman00(4*a,4*b) = final(4,4,i);
        i = i + 1;
    end
end

predi_final_foreman00 = foreman00 - final_foreman00;

%----------------------Section 1.2-------------------------%
%DCT
DCT = zeros(288,352);
cf = [1,1,1,1;2,1,-1,-2;1,-1,-1,1;1,-2,2,-1];
cft = [1,2,1,1;1,1,-1,-2;1,-1,-1,2;1,-2,1,-1];
for a = 1:72
    for b = 1:88
        X = [predi_final_foreman00(4*a-3,4*b-3),predi_final_foreman00(4*a-3,4*b-2),predi_final_foreman00(4*a-3,4*b-1),predi_final_foreman00(4*a-3,4*b);
        predi_final_foreman00(4*a-2,4*b-3),predi_final_foreman00(4*a-2,4*b-2),predi_final_foreman00(4*a-2,4*b-1),predi_final_foreman00(4*a-2,4*b);
        predi_final_foreman00(4*a-1,4*b-3),predi_final_foreman00(4*a-1,4*b-2),predi_final_foreman00(4*a-1,4*b-1),predi_final_foreman00(4*a-1,4*b);
        predi_final_foreman00(4*a,4*b-3),predi_final_foreman00(4*a,4*b-2),predi_final_foreman00(4*a,4*b-1),predi_final_foreman00(4*a,4*b)];
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
%fast DCT
fast_DCT = zeros(288,352);
for a = 1:288
    for b = 1:88
        fast_DCT(a,4*b-3) = predi_final_foreman00(a,4*b-3)+predi_final_foreman00(a,4*b-2)+predi_final_foreman00(a,4*b-1)+predi_final_foreman00(a,4*b);
        fast_DCT(a,4*b-2) = 2*predi_final_foreman00(a,4*b-3)+predi_final_foreman00(a,4*b-2)-predi_final_foreman00(a,4*b-1)-2*predi_final_foreman00(a,4*b);
        fast_DCT(a,4*b-1) = predi_final_foreman00(a,4*b-3)-predi_final_foreman00(a,4*b-2)-predi_final_foreman00(a,4*b-1)+predi_final_foreman00(a,4*b);
        fast_DCT(a,4*b) = predi_final_foreman00(a,4*b-3)-2*predi_final_foreman00(a,4*b-2)+2*predi_final_foreman00(a,4*b-1)-predi_final_foreman00(a,4*b);
    end
end
inverse_fast_DCT = zeros(288,352);
for a = 1:288
    for b = 1:88
        inverse_fast_DCT(a,4*b-3) = (fast_DCT(a,4*b-3)+fast_DCT(a,4*b-2)+fast_DCT(a,4*b-1)+0.5*fast_DCT(a,4*b))/4;
        inverse_fast_DCT(a,4*b-2) = (fast_DCT(a,4*b-3)+0.5*fast_DCT(a,4*b-2)-fast_DCT(a,4*b-1)-fast_DCT(a,4*b))/4;
        inverse_fast_DCT(a,4*b-1) = (fast_DCT(a,4*b-3)-0.5*fast_DCT(a,4*b-2)-fast_DCT(a,4*b-1)+fast_DCT(a,4*b))/4;
        inverse_fast_DCT(a,4*b) = (fast_DCT(a,4*b-3)-fast_DCT(a,4*b-2)+fast_DCT(a,4*b-1)-0.5*fast_DCT(a,4*b))/4;
    end
end

%----------------------Section 1.3-------------------------%
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
        W(4*a-3,4*b-3) = round(temp(1,1)*0.25/0.6875);
        W(4*a-3,4*b-2) = round(temp(1,2)*0.158/0.6875);
        W(4*a-3,4*b-1) = round(temp(1,3)*0.25/0.6875);
        W(4*a-3,4*b) = round(temp(1,4)*0.158/0.6875);
        W(4*a-2,4*b-3) = round(temp(2,1)*0.158/0.6875);
        W(4*a-2,4*b-2) = round(temp(2,2)*0.1/0.6875);
        W(4*a-2,4*b-1) = round(temp(2,3)*0.158/0.6875);
        W(4*a-2,4*b) = round(temp(2,4)*0.1/0.6875);
        W(4*a-1,4*b-3) = round(temp(3,1)*0.25/0.6875);
        W(4*a-1,4*b-2) = round(temp(3,2)*0.158/0.6875);
        W(4*a-1,4*b-1) = round(temp(3,3)*0.25/0.6875);
        W(4*a-1,4*b) = round(temp(3,4)*0.158/0.6875);
        W(4*a,4*b-3) = round(temp(4,1)*0.158/0.6875);
        W(4*a,4*b-2) = round(temp(4,2)*0.1/0.6875);
        W(4*a,4*b-1) = round(temp(4,3)*0.158/0.6875);
        W(4*a,4*b) = round(temp(4,4)*0.1/0.6875);
    end
end
%Inverse quantize
inverse_W = zeros(288,352);
for a = 1:72
    for b = 1:88
        Y = [W(4*a-3,4*b-3)*0.25*0.6875*64,W(4*a-3,4*b-2)*0.316*0.6875*64,W(4*a-3,4*b-1)*0.25*0.6875*64,W(4*a-3,4*b)*0.316*0.6875*64;
        W(4*a-2,4*b-3)*0.316*0.6875*64,W(4*a-2,4*b-2)*0.4*0.6875*64,W(4*a-2,4*b-1)*0.316*0.6875*64,W(4*a-2,4*b)*0.4*0.6875*64;
        W(4*a-1,4*b-3)*0.25*0.6875*64,W(4*a-1,4*b-2)*0.316*0.6875*64,W(4*a-1,4*b-1)*0.25*0.6875*64,W(4*a-1,4*b)*0.316*0.6875*64;
        W(4*a,4*b-3)*0.316*0.6875*64,W(4*a,4*b-2)*0.4*0.6875*64,W(4*a,4*b-1)*0.316*0.6875*64,W(4*a,4*b)*0.4*0.6875*64];
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
recon_foreman00 = inverse_W + final_foreman00;
errorFrame00 = foreman00 - recon_foreman00;
PSNR00 = 10*log10(255*255/mean(mean(errorFrame00.^2)));

%----------------------Section 2.1-------------------------%
foreman01 = Yseq(:,:,2);
foreman02 = Yseq(:,:,3);
foreman03 = Yseq(:,:,4);
foreman04 = Yseq(:,:,5);
foreman05 = Yseq(:,:,6);
foreman06 = Yseq(:,:,7);
foreman07 = Yseq(:,:,8);
foreman08 = Yseq(:,:,9);
foreman09 = Yseq(:,:,10);
motionVect01 = ThreeStepSearch(foreman01, recon_foreman00);
est_foreman01 = motionComp(recon_foreman00, motionVect01);
diff01 = foreman01 - est_foreman01;
recon_foreman01 = est_foreman01 + Dct(diff01);
errorFrame01 = foreman01 - recon_foreman01;
PSNR01 = 10*log10(255*255/mean(mean(errorFrame01.^2)));

motionVect02 = ThreeStepSearch(foreman02, recon_foreman01);
est_foreman02 = motionComp(recon_foreman01, motionVect02);
diff02 = foreman02 - est_foreman02;
recon_foreman02 = est_foreman02 + Dct(diff02);
errorFrame02 = foreman02 - recon_foreman02;
PSNR02 = 10*log10(255*255/mean(mean(errorFrame02.^2)));

motionVect03 = ThreeStepSearch(foreman03, recon_foreman02);
est_foreman03 = motionComp(recon_foreman02, motionVect03);
diff03 = foreman03 - est_foreman03;
recon_foreman03 = est_foreman03 + Dct(diff03);
errorFrame03 = foreman03 - recon_foreman03;
PSNR03 = 10*log10(255*255/mean(mean(errorFrame03.^2)));

motionVect04 = ThreeStepSearch(foreman04, recon_foreman03);
est_foreman04 = motionComp(recon_foreman03, motionVect04);
diff04 = foreman04 - est_foreman04;
recon_foreman04 = est_foreman04 + Dct(diff04);
errorFrame04 = foreman04 - recon_foreman04;
PSNR04 = 10*log10(255*255/mean(mean(errorFrame04.^2)));

motionVect05 = ThreeStepSearch(foreman05, recon_foreman04);
est_foreman05 = motionComp(recon_foreman04, motionVect05);
diff05 = foreman05 - est_foreman05;
recon_foreman05 = est_foreman05 + Dct(diff05);
errorFrame05 = foreman05 - recon_foreman05;
PSNR05 = 10*log10(255*255/mean(mean(errorFrame05.^2)));

motionVect06 = ThreeStepSearch(foreman06, recon_foreman05);
est_foreman06 = motionComp(recon_foreman05, motionVect06);
diff06 = foreman06 - est_foreman06;
recon_foreman06 = est_foreman06 + Dct(diff06);
errorFrame06 = foreman06 - recon_foreman06;
PSNR06 = 10*log10(255*255/mean(mean(errorFrame06.^2)));

motionVect07 = ThreeStepSearch(foreman07, recon_foreman06);
est_foreman07 = motionComp(recon_foreman06, motionVect07);
diff07 = foreman07 - est_foreman07;
recon_foreman07 = est_foreman07 + Dct(diff07);
errorFrame07 = foreman07 - recon_foreman07;
PSNR07 = 10*log10(255*255/mean(mean(errorFrame07.^2)));

motionVect08 = ThreeStepSearch(foreman08, recon_foreman07);
est_foreman08 = motionComp(recon_foreman07, motionVect08);
diff08 = foreman08 - est_foreman08;
recon_foreman08 = est_foreman08 + Dct(diff08);
errorFrame08 = foreman08 - recon_foreman08;
PSNR08 = 10*log10(255*255/mean(mean(errorFrame08.^2)));

motionVect09 = ThreeStepSearch(foreman09, recon_foreman08);
est_foreman09 = motionComp(recon_foreman08, motionVect09);
diff09 = foreman09 - est_foreman09;
recon_foreman09 = est_foreman09 + Dct(diff09);
errorFrame09 = foreman09 - recon_foreman09;
PSNR09 = 10*log10(255*255/mean(mean(errorFrame09.^2)));