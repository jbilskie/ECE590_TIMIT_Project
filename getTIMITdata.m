function [wavData, Fs] = getTIMITdata(timitFile)
%
% function [wavData, Fs] = getTIMITdata(timitFile)
%
% Read in a TIMIT file, remove header, and pass back the data.  The outputs
%   can be used as follows:  soundsc(wavData,Fs).  Or it can be written to
%   new WAV files.
%
% VARIABLES:
%   timitFile   -   string containg the name and path of the file to be
%                   processed
%
% OUTPUT:
%   wavData     -   (N x 1) array of the actual sound data
%   Fs          -   sampling frequency (this is hard coded based on the
%                   info provided with the TIMIT data)
%
% 05/23/2011 CST
%

Fs = 16000;         % Specified in our version of TIMIT

% Open file
fid = fopen(timitFile);

% Remove header
newPointer = fseek(fid,1024,-1);    % Size of header specified with TIMIT


% Read the remaining data
wavData = fread(fid,inf,'int16');
fclose(fid);
% Added by SD
wavData= scaleSequence(wavData);