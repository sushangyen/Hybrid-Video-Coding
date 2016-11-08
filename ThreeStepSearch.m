function motionVect = ThreeStepSearch(imgP, imgI)

[row col] = size(imgI);

mbSize = 16;
p = 8;

vectors = zeros(2,row*col/mbSize^2);
costs = ones(3,3) * 65537;

L = floor(log2(p+1));
stepMax = 2^(L-1);


mbCount = 1;
for a =1 : mbSize : row-mbSize+1
    for b = 1 : mbSize : col-mbSize+1

        x = b;
        y = a;
        
        costs(2,2) = costFuncMAD(imgP(a:a+mbSize-1,b:b+mbSize-1),imgI(a:a+mbSize-1,b:b+mbSize-1),mbSize);
        stepSize = stepMax;
        
        while(stepSize>=1)
            for m = - stepSize : stepSize : stepSize
                for n = -stepSize : stepSize : stepSize
                    refBlkVer = y + m;
                    refBlkHor = x + n; 
                    if ( refBlkVer < 1 || refBlkVer+mbSize-1 > row || refBlkHor < 1 || refBlkHor+mbSize-1 > col)
                        continue;
                    end

                    costRow = m/stepSize + 2;
                    costCol = n/stepSize + 2;
                    if (costRow == 2 && costCol == 2)
                        continue
                    end
                    costs(costRow, costCol ) = costFuncMAD(imgP(a:a+mbSize-1,b:b+mbSize-1),imgI(refBlkVer:refBlkVer+mbSize-1, refBlkHor:refBlkHor+mbSize-1), mbSize);
                end
            end
            
            [dx, dy, min] = minCost(costs);  
            
            x = x + (dx-2)*stepSize;
            y = y + (dy-2)*stepSize;

            stepSize = stepSize / 2;
            costs(2,2) = costs(dy,dx);

        end
        vectors(1,mbCount) = y - a;
        vectors(2,mbCount) = x - b;
        mbCount = mbCount + 1;
        costs = ones(3,3) * 65537;
    end
end

motionVect = vectors;

function cost = costFuncMAD(currentBlk,refBlk, n)

err = 0;
    for a = 1:n
        for b = 1:n
            err = err + abs((currentBlk(a,b) - refBlk(a,b)));
        end
    end
cost = err / (n*n);

function [dx, dy, min] = minCost(costs)

[row, col] = size(costs);

min = 65537;

for a = 1:row
    for b = 1:col
        if (costs(a,b) < min)
            min = costs(a,b);
            dx = b; dy = a;
        end
    end
end



