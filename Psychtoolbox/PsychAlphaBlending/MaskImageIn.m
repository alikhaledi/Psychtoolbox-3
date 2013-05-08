function mMasked=MaskImageIn(m,alphaIn)
% mMasked=MaskImageIn(m [,alphaIn])
%
% Accept an image matrix "m" and return "nMasked", holding the same image
% but with adjusted alpha values.  MaskImageIn sets full transparency
% for pixels with value zero and sets full opacity for pixels with
% non-zero value.
%
% If the optional alphaIn argument is specified then MaskImageIn sets
% non-zero pixels to alphaIn opacity instad of to full opacity, 255. 
%
% see also: SetImageAlpha, MaskImageOut, AlphaDemo. 

% HISTORY
%
% mm/dd/yy
%
% 1/28/05   awi  Wrote it.
% 5/02/13   mk   Made it hopefully work.

if nargin<2
   alphaIn=255;
end

dims=size(m);
numDims=length(dims);
if numDims > 3
    error('The matrix argument must have no more than three dimensions');
end

if numDims==2
    mMasked=repmat(m, [1, 1, 3]);
else
    mMasked=m;
end

sumPlanes=mMasked(:,:,1) + mMasked(:,:,2) + mMasked(:,:,3);
isNonZero=sumPlanes ~= 0;
mMasked(:,:,4)=isNonZero * alphaIn;
