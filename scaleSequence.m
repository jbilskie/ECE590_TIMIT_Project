function xScaled= scaleSequence(x)
[nRows nCols]= size(x);

% Ensure that the signal extends in the row dimension
if nRows < nCols
    x=x';
    [nRows nCols]= size(x);
end

xScaled= zeros(nRows,nCols);
% Scale waveData to be between -1 and +1
for thisCol=1:nCols
    xmin = min(x(:,thisCol));
    xmax = max(x(:,thisCol));
    slim = [xmin xmax];
    
    % Scale the data so that the limits in
    % SLIM are scaled to the range [-1 +1]
    %
    dx=diff(slim);
    if dx==0,
        % Protect against divide-by-zero errors:
        xScaled(:,thisCol) = zeros(length(x),1);
    else
        xScaled(:,thisCol) = (x(:,thisCol)-slim(1))/dx*2-1;
    end
end