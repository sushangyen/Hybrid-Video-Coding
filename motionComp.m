function imgComp = motionComp(image, motionVect)

[row col] = size(image);

mbSize = 16;

mbCount = 1;
for a= 1:mbSize:row-mbSize+1
    for b = 1:mbSize:col-mbSize+1
        
        dy = motionVect(1,mbCount);
        dx = motionVect(2,mbCount);
        refBlk_y = a+ dy;
        refBlk_x = b + dx;
        imageComp(a:a+mbSize-1,b:b+mbSize-1) = image(refBlk_y:refBlk_y+mbSize-1, refBlk_x:refBlk_x+mbSize-1);
    
        mbCount = mbCount + 1;
    end
end

imgComp = imageComp;